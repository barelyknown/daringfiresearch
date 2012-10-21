class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.text :summary
      t.integer :source_id
      t.text :display_url
      t.datetime :published_at

      t.timestamps
    end
  end
end
