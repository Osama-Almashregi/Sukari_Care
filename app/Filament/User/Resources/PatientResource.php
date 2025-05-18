<?php

namespace App\Filament\User\Resources;

use App\Filament\User\Resources\PatientResource\Pages;
use App\Filament\User\Resources\PatientResource\RelationManagers;
use App\Models\doctor;
use App\Models\Patient;
use App\Models\symptom;
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
use Illuminate\Support\Facades\Auth;

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
                TextInput::make('id')->hidden(),
                TextInput::make('user.name')->label('اسم المستخدم'),
                // Select::make('glucose_reading.id')->,
                TextInput::make('user.email')->label('البريد الإلكتروني'),
                TextInput::make('user.phone')->label('رقم الهاتف'),
                TextInput::make('user.password')->label('كلمة المرور'),
                // TextInput::make('user.profile.first_name')->label('الاسم الأول'),
                // TextInput::make('user.profile.last_name')->label('الاسم الأخير'),
                // DateTimePicker::make('user.profile.date_of_birth')->label('تاريخ الميلاد'),
                // TextInput::make('user.profile.contact_info')->label('معلومات التواصل')->nullable(),
                // FileUpload::make('user.profile.image_url')->label('صورة الملف الشخصي'),
                TextInput::make('symptoms.symptom_description')->label('وصف المرض')->nullable(),
                Select::make('symptoms.severity')->label('خطورة المرض')->options([
                    'mild' => 'ضعيفة',
                    'moderate' => 'متوسطة',
                    'severe' => 'خطيرة',
                ]),
                // TextInput::make('medical_history.notes')->label(' ملاحظات')->nullable(),
                // Select::make('medical_history.status')->options([
                //     'active' => 'نشط',
                //     'resolved' => 'محلول',
                // ]),
                // TextInput::make('physical_examination.blood_pressure')->label('ضغط الدم')->nullable(),
                // TextInput::make('physical_examination.weight')->label('وزن')->nullable(),
                // TextInput::make('physical_examination.height')->label('طول')->nullable(),
                // TextInput::make('physical_examination.heart_rate')->label('معدل نبضا القلب')->nullable(),
                // TextInput::make('physical_examination.bmi')->label('BMI')->nullable(),
                // TextInput::make('physical_examination.skin_examination_notes')->label('ملاحظات الجلد')->nullable(),
                // TextInput::make('physical_examination.foot_examination_notes')->label('ملاحظات القدم')->nullable(),
   
            ]);
            }
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
            TextColumn::make('user.name') // Create a new column for the full name
                ->label('الاسم الكامل'),
            TextColumn::make('user.email')->label('البريد الإلكتروني')->searchable()->sortable()->toggleable(),
            TextColumn::make('user.phone')->label('رقم الهاتف')->sortable()->toggleable(),
             // Make it sortable if needed                
            ])
            ->filters([
                //
            ])->modifyQueryUsing(function (Builder $query) {
              $doctor = doctor::where('user_id', Auth::user()->id)->first();
              return $query->where('doctor_id', $doctor->id);
            })
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
