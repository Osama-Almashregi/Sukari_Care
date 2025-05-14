<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\BlogResource\Pages;
use App\Filament\Admin\Resources\BlogResource\RelationManagers;
use App\Models\Blog;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;

class BlogResource extends Resource
{
    protected static ?string $model = Blog::class;

    // protected static ?string $navigationGroup = 'المقالات';

    protected static ?string $navigationLabel = 'المقالات';
        protected static ?string $pluralLabel = 'المقالات';
        protected static ?string $modelLabel = 'المقال';
    
        



    protected static ?string $navigationIcon = 'heroicon-o-newspaper';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('title')->label('عنوان المقال')->required(),
                TextInput::make('content')->label('وصف المقال')->required(), 
                TextInput::make('slug')->label('slug')->required()->label('العنوان الثاني'),   
                FileUpload::make('image_url')->label('صورة المقال')->disk('public')->directory('uploads/blogs')->required(),
                //send the user_id of the current user
                Hidden::make('author_id')->default(Auth::user()->id),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
              TextColumn::make('title')->label('عنوان المقال')->toggleable()->searchable()->sortable(),
                TextColumn::make('content')->label('وصف المقال')->toggleable(),
                ImageColumn::make('image_url')->label('صورة المقال'),

                TextColumn::make('created_at')->label('تاريخ الاضافة')->toggleable()->dateTime('d/m/Y')->sortable(),
            ])
            ->filters([
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
            'index' => Pages\ListBlogs::route('/'),
            'create' => Pages\CreateBlog::route('/create'),
            'edit' => Pages\EditBlog::route('/{record}/edit'),
        ];
    }
}
