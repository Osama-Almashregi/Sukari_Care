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
        Schema::table('doctors', function (Blueprint $table) {
            $table->string('license_number')->nullable()->after('resume');
            $table->string('license_image')->nullable()->after('license_number');
            $table->date('license_expiry_date')->nullable()->after('license_image');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('doctors', function (Blueprint $table) {
            $table->dropColumn('license_image');
            $table->dropColumn('license_number');
            $table->dropColumn('license_expiry_date');
        });
    }
};
