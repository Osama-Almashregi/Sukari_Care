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
        Schema::create('lifestyle_assessment', function (Blueprint $table) {
            $table->id('id');
            $table->unsignedBigInteger('patient_id');
            $table->string('physical_activity_level')->nullable();
            // $table->unsignedBigInteger('drug_id')->nullable();
            $table->foreign('patient_id')->references('id')->on('patients')->onDelete('cascade');
            // $table->foreign('drug_id')->references('id')->on('used_drugs')->onDelete('cascade');
            $table->timestamps();
        });
        // Schema::create('drugs', function (Blueprint $table) {
        //     $table->id('id');
        //     $table->string('drog_name')->nullable();
        //     $table->enum('drug_type', ['pills', 'injections', 'syrup'])->nullable();
        //     $table->timestamps();
        // });
        

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lifestyle_assessment');
        // Schema::dropIfExists('drugs');

    }
};
