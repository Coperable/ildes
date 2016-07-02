<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePageTable extends Migration {
    public function up() {
        Schema::create('pages', function (Blueprint $table) {
            $table->increments('id');

            $table->string('title');

            $table->longText('somos_main_title')->nullable();
            $table->longText('somos_main')->nullable();
            $table->longText('somos_detail_title')->nullable();
            $table->longText('somos_detail')->nullable();

            $table->longText('mision_main_title')->nullable();
            $table->longText('mision_main')->nullable();
            $table->longText('mision_detail_title')->nullable();
            $table->longText('mision_detail')->nullable();

            $table->longText('hacemos_main_title')->nullable();
            $table->longText('hacemos_main')->nullable();
            $table->longText('hacemos_detail_title')->nullable();
            $table->longText('hacemos_detail')->nullable();

            $table->longText('somos_main_title_en')->nullable();
            $table->longText('somos_main_en')->nullable();
            $table->longText('somos_detail_title_en')->nullable();
            $table->longText('somos_detail_en')->nullable();

            $table->longText('mision_main_title_en')->nullable();
            $table->longText('mision_main_en')->nullable();
            $table->longText('mision_detail_title_en')->nullable();
            $table->longText('mision_detail_en')->nullable();

            $table->longText('hacemos_main_title_en')->nullable();
            $table->longText('hacemos_main_en')->nullable();
            $table->longText('hacemos_detail_title_en')->nullable();
            $table->longText('hacemos_detail_en')->nullable();

            $table->mediumText('footer_section')->nullable();
            $table->mediumText('footer_section_en')->nullable();

            $table->boolean('is_home')->default(true);

            $table->mediumText('facebook_link')->nullable();



            $table->timestamps();
        });

    }

    public function down() {
        Schema::drop('pages');
    }
}
