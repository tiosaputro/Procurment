<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use Notifiable,HasApiTokens;
    protected $fillable = [
        'usr_id',
        'usr_name',
        'usr_fullname',
        'usremail',
        'usr_passwd', 
        'usr_image'
    ];
    protected $table = 'mng_user';
    protected $primaryKey = 'usr_id';
    public $incrementing = false;
    public $timestamps = false;
}
