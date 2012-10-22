class AddQueryIndexToSearches < ActiveRecord::Migration
  def change
    add_index :searches, :query
  end
end
