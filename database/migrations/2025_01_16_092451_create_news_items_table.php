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
        Schema::create('news_items', function (Blueprint $table) {
            $table->id();
            $table->string('api_source');
            $table->string('news_source');
            $table->longText('section')->nullable();
            $table->string('author')->nullable();
            $table->longText('title')->nullable();
            $table->longText('content')->nullable();
            $table->longText('url');
            // $table->string('url')->unique();
            $table->longText('image_url')->nullable();
            $table->string('published_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('news_items');
    }
};
