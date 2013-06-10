class Podcast < ActiveRecord::Base
  attr_accessible :author, :category, :description, :explicit, :keywords, :slug, :subcategories, :title, :url
end
