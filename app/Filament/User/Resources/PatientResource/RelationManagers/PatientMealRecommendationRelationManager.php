<?php

namespace App\Filament\User\Resources\PatientResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class PatientMealRecommendationRelationManager extends RelationManager
{
    protected static string $relationship = 'patient_meal_recommendation';

    protected static ?string $title = 'التوصيات الغذائية';  

    protected static ?string $pluralLabel = 'التوصيات الغذائية';

    protected static ?string $label = 'توصية غذائية';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
       Forms\Components\Select::make('meal_id')->relationship('meal', 'meal_name')->required()->label('اسم الوجبة'),

                Forms\Components\TextInput::make('meal_setup')->required()
                    ->required()->label('وصف الوجبة')
                    ->maxLength(255),
                Forms\Components\Select::make('meal_time')->required()->options([
                    'وقت الفطور' => 'وقت الفطور',
                    'وقت الغداء' => 'وقت الغداء',
                    'وقت العشاء' => 'وقت العشاء',
                ])->label('وقت الوجبة'),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('meal_description')
            ->columns([
                //using relation column i will get the name of the meal
                Tables\Columns\TextColumn::make('meal.meal_name')
              ->label('اسم الوجبة'),
                Tables\Columns\TextColumn::make('meal_setup')->label('وصف الوجبة'),
                
                Tables\Columns\TextColumn::make('meal_time')->label('وقت الوجبة'),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
