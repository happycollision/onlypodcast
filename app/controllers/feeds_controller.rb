class FeedsController < ApplicationController
	
	def index
		
		render("show.rss")
	end
	
	def show
		@podcast = Podcast.where(:slug => params[:slug])[0]
		@podcast.episodes.reverse!
		
# 		respond_to do |format|
#       format.rss {render :layout => false} # master.rss.builder (?)
#     end

		render('show.rss')
	end
	
end
