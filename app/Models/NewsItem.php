<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NewsItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'content',
        'api_source',
        'news_source',
        'image_url',
        'date',
        'is_active',
        'is_homepage',
        'source',
        'section',
        'author',
        'url',
        'imageUrl',
        'published_at',
    ];
}
