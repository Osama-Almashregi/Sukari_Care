<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {Schema::create('blog_comments', function (Blueprint $table) {
        $table->id('comment_id');
        $table->unsignedBigInteger('blog_id');
        $table->unsignedBigInteger('user_id');
        $table->foreign('blog_id')->references('blog_id')->on('blogs')->onDelete('cascade');
        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade'); // تأكد من استخدام cascade هنا
        $table->text('comment');
        $table->timestamps();
    });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('blog_comments');
    }
};
