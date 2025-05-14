<?php

namespace App\Filament\User\Resources\PatientResource\RelationManagers;

use Dom\Text;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class GlucoseReadingRelationManager extends RelationManager
{
    protected static string $relationship = 'glucose_reading';

    protected static ?string $title = ' قراءات السكري';

    protected static ?string $recordTitleAttribute = 'reading_value';
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('reading_value')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('reading_value')
            ->defaultSort('reading_value', 'desc')
            ->columns([
               TextColumn::make('reading_value')->label('قيمة القراءة')->toggleable()->searchable()->sortable(),
TextColumn::make('reading_type')
    ->label('وقت القراءة')
    ->getStateUsing(function ($record) {
        return $record->reading_type === 'after_meal' ? 'بعد الاكل' : 
               ($record->reading_type === 'before_meal' ? 'قبل الاكل' : $record->reading_type);
    }),                   
            ])
            ->filters([
                //
            ])
            ->headerActions([
                // Tables\Actions\CreateAction::make(),
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
