<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {   
        DB::table('mng_user')->insert([
            'usr_id' => '2',
            'usr_name' => 'wahyuu',
            'usr_passwd' => Hash::make('password'),
            'usr_fullname'=>'wahyu sisokoo',
            'usr_image' => '1636343615.png',
            'usr_email' => 'admin2@gmail.com',
        ]);
    }
}
