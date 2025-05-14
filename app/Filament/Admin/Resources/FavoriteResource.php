<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\FavoriteResource\Pages;
use App\Filament\Admin\Resources\FavoriteResource\RelationManagers;
use App\Models\Favorite;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class FavoriteResource extends Resource
{
    protected static ?string $model = Favorite::class;
    protected static ?string $modelLabel = 'المفضلة';
    protected static ?string $navigationLabel = 'المفضلة';
    protected static ?string $pluralLabel = 'المفضلة';




    protected static ?string $navigationIcon = 'heroicon-o-heart';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('blog_id')->relationship('blog', 'title')->required(),
                TextInput::make('title')->label('عنوان المقال')->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable()->label("ID"),// Create a new column for the full name
                TextColumn::make('user.name')->label('اسم المستخدم'), // Create a new column for the full name
                TextColumn::make('blog.title')->label('عنوان المقال'), // Create a new column for the full name
            ])
            ->filters([
                //
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

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListFavorites::route('/'),
            'create' => Pages\CreateFavorite::route('/create'),
            'edit' => Pages\EditFavorite::route('/{record}/edit'),
        ];
    }
}
