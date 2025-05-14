<?php

namespace App\Filament\User\Resources;

use App\Filament\User\Resources\PatientResource\Pages;
use App\Filament\User\Resources\PatientResource\RelationManagers;
use App\Models\Patient;
use Filament\Forms;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\SelectColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Guava\FilamentModalRelationManagers\Actions\Table\RelationManagerAction;

class PatientResource extends Resource
{
    protected static ?string $model = Patient::class;

        protected static ?string $pluralLabel = 'المرضى';

   
    protected static ?string $navigationLabel = 'المرضى';
    

    protected static ?string $navigationIcon = 'heroicon-o-user';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('user.name')->label('اسم المستخدم')->required(),
                // Select::make('glucose_reading.id')->,
                TextInput::make('user.email')->label('البريد الإلكتروني')->required(),
                TextInput::make('user.phone')->label('رقم الهاتف')->required(),
                TextInput::make('user.password')->label('كلمة المرور')->required(),
                TextInput::make('user.profile.first_name')->label('الاسم الأول')->required(),
                TextInput::make('user.profile.last_name')->label('الاسم الأخير')->required(),
                DateTimePicker::make('user.profile.date_of_birth')->label('تاريخ الميلاد')->required(),
                TextInput::make('user.profile.contact_info')->label('معلومات التواصل')->required(),
                // Hidden::make('user.profile.user_id')->label('user_id')->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
            TextColumn::make('user.name') // Create a new column for the full name
                ->label('الاسم الكامل') // Label for the new column
                ->formatStateUsing(fn ($record) => "{$record->user->profile->first_name} {$record->user->profile->last_name}") // Concatenate first and last name
                ->sortable()->toggleable(),
            TextColumn::make('user.email')->label('البريد الإلكتروني')->searchable()->sortable()->toggleable(),
            TextColumn::make('user.phone')->label('رقم الهاتف')->sortable()->toggleable(),
             // Make it sortable if needed                
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                RelationManagerAction::make('lesson-relation-manager')
                    ->label('عرض القراءات')->color('success')
                    ->relationManager(RelationManagers\GlucoseReadingRelationManager::make()),
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
            RelationManagers\GlucoseReadingRelationManager::class,
            RelationManagers\PatientMealRecommendationRelationManager::class,
            RelationManagers\PatientDrugRecommendationRelationManager::class
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPatients::route('/'),
            'create' => Pages\CreatePatient::route('/create'),
            'edit' => Pages\EditPatient::route('/{record}/edit'),
        ];
    }
}
