<?php

namespace App\Repositories\Interfaces;

interface NewsItemRepositoryInterface
{
    public function get_all_news_items();
    public function get_all_news_categories();
    public function get_news_items_by_id($newsItemId);
    public function delete_news_item($newsItemId);
    public function create_news_item(array $newsItemDetails);
    public function update_news_item($newsItemId, array $newDetails);
    public function get_user_news_preferences();
    public function get_user_news(string $category = null);
}
