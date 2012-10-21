class Link < ActiveRecord::Base
  attr_accessible :display_url, :published_at, :source_id, :summary, :title, :url
end
