class ChangeTitleColumnTypeForPosts < ActiveRecord::Migration
  def up
    change_column :posts, :title, :text
  end

  def down
    change_column :posts, :title, :string
  end
end
