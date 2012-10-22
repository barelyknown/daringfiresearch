class AddLinkAndLinkTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :link_title, :text
    add_column :posts, :link_url, :text
  end
end
