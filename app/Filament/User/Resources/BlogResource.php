<?php

namespace App\Filament\User\Resources;

use App\Filament\User\Resources\BlogResource\Pages;
use App\Filament\User\Resources\BlogResource\RelationManagers;
use App\Models\Blog;
use App\Models\doctor;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;

class BlogResource extends Resource
{
    protected static ?string $model = Blog::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->label('الرقم')->sortable()->toggleable(),
                TextColumn::make('author_id')->label('الطبيب')->sortable()->toggleable(),
                TextColumn::make('title')->label('العنوان')->searchable()->sortable()->toggleable(),
                TextColumn::make('content')->label('الوصف')->searchable()->sortable()->toggleable(),
                TextColumn::make('author.name')->label('اسم الطبيب')->searchable()->sortable()->toggleable(),
                
            ])
            // ->modifyQueryUsing(function (Builder $query) {
            //   $doctor = User::where('id', Auth::user()->id)->first();
            // //   $blog = blog::where('author_id', $doctor->id)->first();
            //   return $query->where('author_id', $doctor->id);
            // })
            ->filters([
                //
            ])
            ->actions([
               
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
            'index' => Pages\ListBlogs::route('/'),
            'create' => Pages\CreateBlog::route('/create'),
            'edit' => Pages\EditBlog::route('/{record}/edit'),
        ];
    }
}
