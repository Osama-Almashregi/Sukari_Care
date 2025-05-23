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
        Schema::create('drug_recommendations', function (Blueprint $table) {
            $table->id('id');
            $table->unsignedBigInteger('patient_id');
            $table->unsignedBigInteger('drug_id');
            $table->string('when_to_take')->nullable();
            $table->string('time_to_take')->nullable();
            $table->string('number_of_takes')->nullable();
            $table->string('image_url')->nullable();
            $table->foreign('patient_id')->references('id')->on('patients')->onDelete('cascade');
            $table->foreign('drug_id')->references('id')->on('drugs')->onDelete('cascade');
            $table->timestamps();
        });
    }   

    

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('drug_recommendations');
    }
};
