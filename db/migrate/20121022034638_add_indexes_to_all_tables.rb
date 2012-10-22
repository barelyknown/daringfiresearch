class AddIndexesToAllTables < ActiveRecord::Migration
  def change
    add_index :links, :source_id
    add_index :post_sources, :post_id
    add_index :post_sources, :source_id
    add_index :post_sources, [:post_id, :source_id]
    add_index :search_links, :search_id
    add_index :search_links, :link_id
    add_index :search_links, [:search_id, :link_id]
    add_index :sources, :posts_count
  end
end
