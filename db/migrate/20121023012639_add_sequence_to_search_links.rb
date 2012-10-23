class AddSequenceToSearchLinks < ActiveRecord::Migration
  def change
    add_column :search_links, :sequence, :integer
  end
end
