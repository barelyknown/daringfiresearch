class CreateSearchLinks < ActiveRecord::Migration
  def change
    create_table :search_links do |t|
      t.integer :search_id
      t.integer :link_id

      t.timestamps
    end
  end
end
