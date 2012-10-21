class CreatePostSources < ActiveRecord::Migration
  def change
    create_table :post_sources do |t|
      t.integer :post_id
      t.integer :source_id

      t.timestamps
    end
  end
end
