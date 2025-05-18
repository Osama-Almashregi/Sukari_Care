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
        Schema::create('patient_goals', function (Blueprint $table) {
            $table->id('id');
            $table->unsignedBigInteger('patient_id');
            $table->text('goal_description')->nullable();
            $table->string('goal_status')->nullable();
            $table->date('target_date')->nullable();
            $table->foreign('patient_id')->references('id')->on('patients')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patient_goals');
    }
};
