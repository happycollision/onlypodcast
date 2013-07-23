class AdminUsersController < ApplicationController

  before_filter :confirm_logged_in


  # GET /admin_users
  # GET /admin_users.json
  def index
  	list
  	render('list')
  end
  def list
    @admin_users = AdminUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @admin_users }
    end
  end

#   # GET /admin_users/1
#   # GET /admin_users/1.json
#   def show
#     @admin_user = AdminUser.find(params[:id])
# 
#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render :json => @admin_user }
#     end
#   end


  # GET /admin_users/new
  # GET /admin_users/new.json
  def new
    @admin_user = AdminUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @admin_user }
    end
  end

  # GET /admin_users/1/edit
  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  # POST /admin_users
  # POST /admin_users.json
  def create
    @admin_user = AdminUser.new(params[:admin_user])

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to @admin_user, :notice => 'AdminUser was successfully created.' }
        format.json { render :json => @admin_user, :status => :created, :location => @admin_user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @admin_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_users/1
  # PUT /admin_users/1.json
  def update
    @admin_user = AdminUser.find(params[:id])

    respond_to do |format|
      if @admin_user.update_attributes(params[:admin_user])
        format.html { redirect_to @admin_user, :notice => 'AdminUser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @admin_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_users/1
  # DELETE /admin_users/1.json
  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
end
