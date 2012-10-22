class Source < ActiveRecord::Base
  require 'open-uri'
  
  SLASHTAG = '/barelyknown/daringfiresearch'
  
  attr_accessible :url, :posts_count
    
  has_many :post_sources
  has_many :posts, through: :post_sources
  
  validates :url, url: true
    
  def self.slashtag(args={})
    args = { eager_load: false }.merge(args)
    @slashtag ||= Blekko.my_account.slashtag(SLASHTAG, args)
  end
    
  def self.add_all_to_slashtag!
    find_in_batches do |sources|
      slashtag.urls.clear
      slashtag.urls += sources.collect(&:url)
      slashtag.save!
    end
  end
  
  def self.remove_from_slashtag!(*urls)
    slashtag.remove_urls!(urls)
  end
  
  def remove_from_slashtag!
    self.class.remove_from_slashtag!(*url)
  end
    
end
