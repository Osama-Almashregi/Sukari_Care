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
        Schema::create('symptom', function (Blueprint $table) {
            $table->id('id');
            $table->unsignedBigInteger('patient_id');
            $table->string('symptom_description')->nullable();
            $table->string('severity')->nullable();
            $table->foreign('patient_id')->references('id')->on('patients')->onDelete('cascade');
            // $table->string('duration')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('symptom');
    }
};
