<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInboxesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inboxes', function (Blueprint $table) {
            $table->id();
            $table->longText('message');
            $table->foreignId('sender_id')->nullable()->constrained('users')->nullOnDelete();
            $table->foreignId('receiver_id')->nullable()->constrained('users')->nullOnDelete();
            $table->bigInteger('inbox_id')->unsigned()->nullable();
            $table->foreign('inbox_id')->references('id')->on('inboxes')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->enum('type', ['notification','mail'])->default('mail');
            $table->tinyInteger('is_read')->default(0); // 0 ->unread , 1 ->is read
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inboxes');
    }
}
