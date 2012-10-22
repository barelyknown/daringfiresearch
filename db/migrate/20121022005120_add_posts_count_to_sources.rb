class AddPostsCountToSources < ActiveRecord::Migration
  def change
    add_column :sources, :posts_count, :integer
  end
end
