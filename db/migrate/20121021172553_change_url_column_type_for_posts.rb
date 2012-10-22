class ChangeUrlColumnTypeForPosts < ActiveRecord::Migration
  def up
    change_column :posts, :url, :text
  end

  def down
    change_column :posts, :url, :string
  end
end
