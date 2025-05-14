<?php

namespace App\Filament\Admin\Resources\BlogCommentResource\Pages;

use App\Filament\Admin\Resources\BlogCommentResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateBlogComment extends CreateRecord
{
    protected static string $resource = BlogCommentResource::class;
}
