class Podcast < ActiveRecord::Base
  
  has_many :episodes
  
  attr_accessible :author, :category, :description, :explicit, :keywords, :slug, :subcategories, :title, :url
end
