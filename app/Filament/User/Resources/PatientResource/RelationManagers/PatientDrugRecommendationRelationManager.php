<?php

namespace App\Filament\User\Resources\PatientResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class PatientDrugRecommendationRelationManager extends RelationManager
{
    protected static string $relationship = 'patient_drug_recommendation';
      protected static ?string $title = 'التوصيات الطبية';  

    protected static ?string $pluralLabel = 'التوصيات الطبية';

    protected static ?string $label = 'توصية طبية';
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                                Forms\Components\Select::make('drug_id')->relationship('drug', 'drog_name')->required(),

              
                Forms\Components\Select::make('number_of_takes')->options([
                    '1' => '1',
                    '2' => '2',
                    '3' => '3',
                ])->label('عدد الاستخدامات')->required(),
                 Forms\Components\Select::make('when_to_take')->options([
                    'after_meal' => 'بعد الاكل',
                    'before_meal' => 'قبل الاكل',
                ])->label('وقت تناول الدواء')->required(),
                      Forms\Components\Select::make('time_to_take')->options([
                    'evening' => 'مساء', 
                    'afternoon' => 'بعد الظهر',
                    'morning' => 'صباحا',
                ])->label('توقيت استخدام الدواء')->required(),
            ]);
                 


    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('when_to_take')
            ->columns([
                Tables\Columns\TextColumn::make('when_to_take')->label('وقت الاستخدام'),
                Tables\Columns\TextColumn::make('time_to_take')->label('توقيت الاستخدام'),

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
