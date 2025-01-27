<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    public function run()
    {
        $categories = [
            ['name' => 'business'],
            ['name' => 'entertainment'],
            ['name' => 'generalhealth'],
            ['name' => 'sciences'],
            ['name' => 'sports'],
            ['name' => 'technology'],
            ['name' => 'Canada'],
            ['name' => 'Switzerland'],
            ['name' => 'China'],
            ['name' => 'Colombia']
        ];

        DB::table('categories')->insert($categories);
    }
}
