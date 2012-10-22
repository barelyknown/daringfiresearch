class ChangeUrlAndTitleForLinks < ActiveRecord::Migration
  def up
    change_column :links, :url, :text
    change_column :links, :title, :text
  end

  def down
    change_column :links, :url, :string
    change_column :links, :title, :string
  end
end
