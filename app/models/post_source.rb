class PostSource < ActiveRecord::Base
  attr_accessible :post_id, :source_id
  
  belongs_to :post
  belongs_to :source
  
  validates :post_id, presence: true
  validates :source_id, presence: true
  
  after_save :set_source_posts_count!
  after_destroy :set_source_posts_count!
  
  def set_source_posts_count!
    source.update_attributes(posts_count: source.posts.count)
  end
  
end
