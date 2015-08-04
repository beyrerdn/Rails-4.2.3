class AddRatingCacheToPost < ActiveRecord::Migration
  def change
    add_column :posts, :rating_cache, :integer, :default => 0
  end
end
