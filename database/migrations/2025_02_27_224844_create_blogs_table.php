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
    {
        Schema::create('blogs', function (Blueprint $table) {
        $table->id('blog_id');
        $table->unsignedBigInteger('author_id');
        $table->string('title');
        $table->string('slug');
        $table->text('content');
        $table->foreign('author_id')->references('id')->on('users')->onDelete('cascade'); // تأكد من استخدام cascade هنا
        $table->string('image_url')->nullable();
        $table->timestamps();
    });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('blogs');
    }
};
