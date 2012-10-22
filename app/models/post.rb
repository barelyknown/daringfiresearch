#!/bin/env ruby
# encoding: utf-8
class Post < ActiveRecord::Base
  
  attr_accessible :published_on, :title, :url, :content, :link_url, :link_title
  has_many :post_sources
  has_many :posts, through: :sources
  validates :url, presence: true, url: true
  after_create :create_post_sources!
  
  def self.create_from_archives!
    archive_list = Nokogiri::HTML(open("http://daringfireball.net/linked"))
    archive_links = archive_list.at_css("[id=archive]").parent.css("a")
    archive_links.each do |archive_link|
      archive = Nokogiri::HTML(open(archive_link.attributes['href'].value))
      main = archive.css("[id='Main']")
      published_on = nil
      main.children.each do |child|
        published_on = Date.parse(child.text) if child.name == 'h2'
        post = nil
        if child.name == 'dl'
          child.children.each do |p|
            if p.name == 'dt'
              post = Post.new
              post.url = p.css("a[class='permalink']").first.attributes['href'].value
              if title_match = p.css("a[class='permalink']").first.attributes['title'].value.match(/‘(.*)’/)
                post.title = title_match[1]
              end
              post.link_url = p.css("a").first.attributes['href'].value
            elsif p.name == 'dd'
              post.published_on = published_on
              post.content = p.inner_html
              post.save!
              post = nil
            end
          end
        end
      end
    end
  end
  
  def create_post_sources!
    source_urls = [link_url] + content.scan(/href=\"(.*?)\"/).flatten
    source_urls.each do |source_url|
      if source_uri = begin; URI.parse(source_url); rescue; end
        if source_uri.scheme && source_uri.host
          source_host_url = source_uri.scheme + "://" + source_uri.host
          unless source = Source.where(url: source_host_url).first
            source = Source.create(url: source_host_url)
          end
          unless post_source = PostSource.where(post_id: self.id, source_id: source.id).any?
            post_source = PostSource.create(post_id: self.id, source_id: source.id)
          end
        end
      end
    end
  end



end
