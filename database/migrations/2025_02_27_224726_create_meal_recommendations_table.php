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
        Schema::create('meals', function (Blueprint $table) {
            $table->id('id');
            $table->string('meal_name');
            $table->string('calories')->nullable();   
            $table->string('meal_description')->nullable();
            $table->string('image_url')->nullable();
            $table->timestamps();
        });
        Schema::create('meal_recommendations', function (Blueprint $table) {
            $table->id('id');
            $table->unsignedBigInteger('patient_id');
            $table->unsignedBigInteger('meal_id');
            $table->text('meal_time')->nullable();
            $table->text('meal_setup')->nullable();
            $table->foreign('patient_id')->references('id')->on('patients')->onDelete('cascade');
            $table->foreign('meal_id')->references('id')->on('meals')->onDelete('cascade');
            $table->timestamps();
        });
      
        


    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('meal_recommendations');
        Schema::dropIfExists('meals');
    }
};
