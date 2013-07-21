class Episode < ActiveRecord::Base
  
  belongs_to :podcast
  
  attr_accessible :art_location, :date, :description, :duration, :file_location, :file_size, :keywords, :number, :podcast_id, :show_notes, :title
end
