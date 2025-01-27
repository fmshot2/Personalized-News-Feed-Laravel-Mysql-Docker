<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SourceUser extends Model
{
    use HasFactory;

    protected $fillable = [
        'source_id',
        'user_id',
        'is_owner',
    ];
}
