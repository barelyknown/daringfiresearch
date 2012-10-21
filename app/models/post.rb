class Post < ActiveRecord::Base
  attr_accessible :published_on, :title, :url
end
