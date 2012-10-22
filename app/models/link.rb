class Link < ActiveRecord::Base
  attr_accessible :display_url, :published_at, :source_id, :summary, :title, :url
  
  has_many :search_links
  has_many :searches, through: :search_links
  belongs_to :source
  
  validates :url, presence: true, url: true
  
  def self.new_or_create_from_blekko_result(result)
    where(url: result.url).first || create do |l|
      l.url = result.url
      l.display_url = result.display_url
      l.published_at = result.datetime
      l.summary = result.snippet
      l.title = result.url_title
      if source_uri = begin; URI.parse(result.url); rescue; end
        if source = Source.where(url: source_uri.scheme + "://" + source_uri.host).first
          l.source_id = source.id
        end
      end
    end
  end
    
end
