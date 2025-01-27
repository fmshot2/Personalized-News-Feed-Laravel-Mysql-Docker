<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Source extends Model
{
    use HasFactory;

    protected $fillable = ['identification', 'name', 'description', 'url', 'category', 'language', 'country'];

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class);
    }
}
