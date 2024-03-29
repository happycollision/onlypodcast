class EpisodesController < ApplicationController
	
	before_filter :confirm_logged_in, :except => [:list, :home, :feature]


  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @episodes }
    end
  end

  def list
    @episodes = Episode.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @episodes }
    end
  end

  def home
    @episodes = Episode.where(:podcast_id => 1).order('number DESC').limit(3)
  end

  def feature
    @episode = Episode.where(:number => params[:episode_num])[0]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @episode }
    end
  end

  # GET /id/1
  # GET /id/1.json
  def show
    @episode = Episode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @episode }
    end
  end
 
  # GET /episodes/new
  # GET /episodes/new.json
  def new
    @episode = Episode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @episode }
    end
  end

  # GET /episodes/1/edit
  def edit
    @episode = Episode.find(params[:id])
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(params[:episode])

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, :notice => 'Episode was successfully created.' }
        format.json { render :json => @episode, :status => :created, :location => @episode }
      else
        format.html { render :action => "new" }
        format.json { render :json => @episode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /episodes/1
  # PUT /episodes/1.json
  def update
    @episode = Episode.find(params[:id])

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html { redirect_to @episode, :notice => 'Episode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @episode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to episodes_url }
      format.json { head :no_content }
    end
  end
end
