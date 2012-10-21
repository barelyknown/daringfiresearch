class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.date :published_on
      t.string :title

      t.timestamps
    end
  end
end
