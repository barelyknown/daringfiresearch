class SearchLink < ActiveRecord::Base
  attr_accessible :link_id, :search_id, :sequence
  
  belongs_to :link
  belongs_to :search
  
  validates :link, presence: true
  validates :search, presence: true
  
end
