class ApplicationController < ActionController::Base
  protect_from_forgery

  protected 
  def confirm_logged_in
  	unless session[:user_id]
  		flash[:notice] = "Whoa there... Log in first."
  		redirect_to(:action => "login", :controller => "access")
  		return false # Must be here to halt the before_filter
  	else
  		return true
  	end
  end

end
