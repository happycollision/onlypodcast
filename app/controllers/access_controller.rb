class AccessController < ApplicationController
  def index
  	menu
  	render("menu")
  end
  
  def menu
  	#disp text and links
  end

  def login
  	#login form
  end
  
  def attempt_login
  	authorized_user = AdminUser.authenticate(params[:username],params[:password])
  	if authorized_user
  		flash[:notice] = "Well done."
  		redirect_to(:action => 'menu')
  	else
  		flash[:notice] = "Nope."
  		redirect_to(:action => 'login')
  	
  	end
  end
  
  def logout
  
  	flash[:notice] = "Bye."
  	redirect_to(:action => 'login')
  end
end
