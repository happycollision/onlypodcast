class Episode < ActiveRecord::Base
  
  belongs_to :podcast
  
  attr_protected []

	def file_location
		"http://#{HOSTNAME}/files/#{podcast.slug}/#{file_name}"
		
	end
	
	def art_location
		"http://#{HOSTNAME}/files/#{podcast.slug}/#{art_name}"
	end
	
end
