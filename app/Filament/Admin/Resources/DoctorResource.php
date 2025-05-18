<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\DoctorResource\Pages;
use App\Filament\Admin\Resources\DoctorResource\RelationManagers;
use App\Filament\Admin\Resources\DoctorResource\RelationManagers\PaitentRelationManager;
use App\Models\Doctor;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\TextInput;

use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;


class DoctorResource extends Resource
{
    protected static ?string $model = Doctor::class;

    protected static ?string $navigationLabel = 'الاطباء';

    protected static ?string $pluralLabel = 'الاطباء';
   protected static ?string $modelLabel = 'طبيب';


    // protected static ?string $slug = '';

    protected static ?string $navigationIcon = 'heroicon-o-user';

    public static function form(Form $form): Form
    {
        return $form
         ->schema([
                Tabs::make('معلومات الطبيب')
                    ->tabs([
                        Tab::make('البيانات الشخصية')
                            ->schema([
                                Section::make('تفاصيل الهوية')
                                    ->schema([
                                        Grid::make(2) // Create a grid with 2 columns
                                            ->schema([
                                                TextInput::make('user.profile.first_name')->label('الاسم الأول')->required(),
                                                TextInput::make('user.profile.last_name')->label('الاسم الأخير')->required(),
                                                DateTimePicker::make('user.profile.date_of_birth')->label('تاريخ الميلاد')->required(),
                                                TextInput::make('user.phone')->label('رقم الهاتف')->required(),
                                                TextInput::make('user.email')->label('البريد الإلكتروني')->required(),
                                                Select::make('status')->label('الحالة')->options([
                                                    'active' => 'نشط',
                                                    'suspend' => 'معطل',
                                                ])->required()->default('active'),
                                            ]),
                                    ]),
                            ]),
                        Tab::make('المستندات')
                            ->schema([
                                Section::make('تحميل المستندات')
                                    ->schema([
                                        Grid::make(2) // Single column for full-width uploads
                                            ->schema([
                                                FileUpload::make('user.profile.image_url')->label('الصورة')->directory('uploads/user profile'),
                                                FileUpload::make('resume')->label('السيرة')->required()->directory('uploads/doctors/cv'),
                                                FileUpload::make('license_image')->label('الرخصة')->required()->directory('uploads/doctors/licenses'),
                                            ]),
                                        Grid::make(2) // Create a grid with 2 columns for other fields
                                            ->schema([
                                                TextInput::make('license_number')->label('رقم الرخصة')->required()->numeric(),
                                                DateTimePicker::make('license_expiry_date')->label('تاريخ انتهاء الرخصة')->required(),
                                            ]),
                                    ]),
                            ]),
                        Tab::make('التخصص')
                            ->schema([
                                Section::make('تفاصيل التخصص')
                                    ->schema([
                                        Grid::make(2) // Create a grid with 2 columns
                                            ->schema([
                                                TextInput::make('specialization')->label('التخصص')->required(),
                                            ]),
                                    ]),
                            ]),
                    ])
                    ->columnSpanFull(), // Set column span to full for the entire form
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
 ->columns([
            TextColumn::make('user.name') // Create a new column for the full name
                ->label('الاسم الكامل') // Label for the new column
                ->formatStateUsing(fn ($record) => "{$record->user->profile->first_name} {$record->user->profile->last_name}") // Concatenate first and last name
                ->sortable()->toggleable(), // Make it sortable if needed
            TextColumn::make('user.email')->label('البريد الإلكتروني')->searchable()->sortable()->toggleable(),
            TextColumn::make('user.phone')->label('رقم الهاتف')->searchable()->sortable()->toggleable(),
            TextColumn::make('specialization')->label('التخصص')->toggleable(),
            TextColumn::make('status')
                    ->label('الحالة')
                    ->formatStateUsing(function ($state) {
                        return $state === 'active'
                            ? '<span class="text-success">مفعل</span>'
                            : '<span class="text-danger">محظور</span>';
                    })
                    ->html() // Enable HTML rendering
                    ->toggleable()
                    ->sortable(),
        ])
            ->filters([
                SelectFilter::make('status')->options([
                    'active' => 'نشط',
                    'paused' => 'معطل',
                ]),
                Filter::make('created_at')->form([
                    Forms\Components\DatePicker::make('created_from')->label('من'),
                    Forms\Components\DatePicker::make('created_until')->label('الى'),
                ])->query(function (Builder $query, array $data): Builder {
                    return $query
                        ->when(
                            $data['created_from'],
                            fn (Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                        )
                        ->when(
                            $data['created_until'],
                            fn (Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                        );
                }),
                
            ])
            ->actions([
                  Tables\Actions\Action::make('toggleStatus')
                    ->label(fn($record) => $record->status === 'active' ? 'حظر ' : 'تفعيل ')
                    ->action(function ($record) {
                        $record->status = $record->status === 'active' ? 'paused' : 'active';
                        $record->save();
                    })
                    ->requiresConfirmation()->icon(fn($record) => $record->status === 'active' ? 'heroicon-o-lock-closed' : 'heroicon-o-lock-open')
                    ->color(fn($record) => $record->status === 'active' ? 'danger' : 'success'),
   
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            PaitentRelationManager::class
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDoctors::route('/'),
            'create' => Pages\CreateDoctor::route('/create'),
            'edit' => Pages\EditDoctor::route('/{record}/edit'),
        ];
    }
}
