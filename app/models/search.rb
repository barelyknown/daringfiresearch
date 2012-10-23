class Search < ActiveRecord::Base
  
  attr_accessible :query
  
  has_many :search_links
  has_many :links, through: :search_links
  
  validates :query, presence: true
  after_create :search!
  
  def to_param
    CGI.escape(query)
  end
  
  def self.find_by_param(param)
    where(query: CGI.unescape(param.strip.downcase))
  end
  
  def blekko
    self.class.blekko
  end
  
  def query=(value)
    self[:query] = value.strip.downcase if value
  end
  
  def standardize_query(raw_query)
    standardized_query = raw_query.strip.downcase
  end
  
  def existing_search
    @existing_search ||= 
      Search.find_by_param(query).where("id != ?", self.id).where("created_at > ?", Time.now - 1.day).first
  end
  
  def search!
    if existing_search
      existing_search.links.each do |link|
        SearchLink.create(link_id: link.id, search_id: self.id)
      end
    else
      results = Blekko.my_account.search(query, slashtags: [Source::SLASHTAG, "/date"])
      sequence = 1
      results.each do |result|
        link = Link.new_or_create_from_blekko_result(result)
        SearchLink.create(link_id: link.id, search_id: self.id, sequence: sequence)
        sequence += 1
      end
    end
    links.all
  end
  
end
