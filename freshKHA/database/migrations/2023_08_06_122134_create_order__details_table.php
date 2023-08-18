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
        Schema::create('order__details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('orderID');
            $table->foreign('orderID')
                    ->references('id')->on('orders')
                    ->onDelete('CASCADE')
                    ->onUpdate('CASCADE');
            $table->unsignedBigInteger('productID');
            $table->foreign('productID')
                    ->references('id')->on('products')
                    ->onDelete('CASCADE')
                    ->onUpdate('CASCADE');
            $table->integer('quantity');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order__details');
    }
};
