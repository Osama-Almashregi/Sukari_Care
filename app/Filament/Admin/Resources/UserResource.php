<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\UserResource\Pages;
use App\Filament\Admin\Resources\UserResource\RelationManagers;
use App\Models\User;
use App\Traits\HasActivation;
use App\Traits\HasActiveIcon;
use Filament\Forms;
use Filament\Forms\Components\Checkbox;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Radio;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Vonage\Verify\Check;

class UserResource extends Resource
{

    protected static ?string $model = User::class;
    protected static ?string $navigationLabel = 'المستخدمين';
    protected static ?string $pluralLabel = 'المستخدمين';

    protected static ?string $modelLabel = 'المستخدم';

    //make for the new user button lable and its new word
    // protected static ?string $modelLabel = 'اضافة مستخدم جديد';

    //add to toggle column label
    // protected static ?string $togg








    protected static ?string $navigationIcon = 'heroicon-o-users';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Tabs::make('معلومات المستخدم')->tabs([
                    Tab::make('البيانات الشخصية')->schema([
                        Section::make('البيانات الشخصية')
                            ->description('قم باضافة بيانات المستخدم')
                            ->schema([
                                TextInput::make('name')->label('اسم المستخدم')->required(),
                                TextInput::make('email')->label('البريد الإلكتروني')->required(),
                                TextInput::make('phone')->label('رقم الهاتف')->required(),
                                TextInput::make('password')->label('كلمة المرور')->required(),
                            ])->columnSpan(1)->columns(2),
                    ]),
                    Tab::make('الصلاحية')->schema([
                        Section::make('الصلاحية')
                            ->description('قم باختيار صلاحية المستخدم')
                            ->schema([
                                Radio::make('role')->label('صلاحية المستخدم')->options([
                                    'admin' => 'ادمن',
                                    'doctor' => 'طبيب',
                                    'patient' => 'مريض',
                                    'relative' => 'قريب'
                                ])->columns(2),
                            ]),
                    ]),
                    Tab::make('الصورة')->schema([
                        Section::make('image_url')
                            ->description('قم باضافة صورة المستخدم')
                            ->schema([
                                FileUpload::make('image_url')
                                    ->label('صورة المستخدم')
                                    ->disk('public')
                                    ->directory('uploads/user_profile')
                                    ->preserveFilenames()
                                    ->image()
                                        ->openable()


                            ])->columnSpan(1),
                    ]),


                ]),
            ])->columns(1);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable()->label("ID"),
                TextColumn::make('name')->label('اسم المستخدم')->searchable()->toggleable()->sortable(),
                TextColumn::make('email')->label('البريد الإلكتروني')->searchable()->toggleable()->sortable(),
               ImageColumn::make('image_url')
    ->label("صورة المستخدم")
    ->sortable()
    ->circular()
    ->getStateUsing(function ($record) {
        // تحقق مما إذا كانت الصورة موجودة
        return !empty($record->image_url) 
            ? asset('storage/'.$record->image_url) 
            :asset('storage/uploads/user_profile/default.png');
    }), 
                TextColumn::make('phone')
                    ->label('رقم الهاتف')
                    ->searchable()
                    ->toggleable()
                    ->sortable()
                    ->formatStateUsing(fn($state) =>  $state . '+')
                    ->html(),
                TextColumn::make('role')->label('الصلاحية')->toggleable()->sortable(),
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
            ->actions([
                Tables\Actions\Action::make('toggleStatus')
                    ->label(fn($record) => $record->status === 'active' ? 'حظر ' : 'تفعيل ')
                    ->action(function ($record) {
                        $record->status = $record->status === 'active' ? 'suspend' : 'active';
                        $record->save();
                    })
                    ->requiresConfirmation()->icon(fn($record) => $record->status === 'active' ? 'heroicon-o-lock-closed' : 'heroicon-o-lock-open')
                    ->color(fn($record) => $record->status === 'active' ? 'danger' : 'success'),
                Tables\Actions\EditAction::make()->label('تعديل'),
                Tables\Actions\DeleteAction::make()->label('حذف'),

            ])->filters(
                [
                    //filter is have phone number
                    Filter::make('phone')
                        ->label('رقم الهاتف')
                        ->query(function (Builder $query): Builder {
                            return $query->whereNotNull('phone')->where('phone', '!=', '');
                        }),
                    //filter for role
                    SelectFilter::make('role')
                        ->label('الصلاحية')
                        ->options([
                            'admin' => 'مدير',
                            'doctor' => 'طبيب',
                            'patient' => 'مريض',
                            'relative' => 'عائلة',
                        ])->default('admin')->placeholder('الصلاحية'),
                    // filter to to status
                    SelectFilter::make('status')
                        ->label('الحالة')
                        ->options([
                            'active' => 'نشط',
                            'suspend' => 'محظور',
                        ])->default('active')->placeholder('الحالة'),
                ]
            )
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()->label('حذف المحدد')->color('danger')->icon('heroicon-o-trash'),
                ])->label('كل الأحداث'),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }
    //     public function getTabs(): array
    // {
    //     return [
    //         'all' => Tab::make('الكل'),
    //         'active' => Tab::make('نشط')
    //             ->modifyQueryUsing(fn (Builder $query) => $query->where('active', true)),
    //         'inactive' => Tab::make('غير نشط')
    //             ->modifyQueryUsing(fn (Builder $query) => $query->where('active', false)),
    //     ];
    // }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
