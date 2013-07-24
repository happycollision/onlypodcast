class Podcast < ActiveRecord::Base
  
  has_many :episodes, :order => 'number DESC'
  
  #attr_accessible :author, :category, :description, :explicit, :keywords, :slug, :subcategories, :title, :url
  attr_protected []

end
