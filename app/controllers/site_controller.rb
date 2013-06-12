class SiteController < ApplicationController
  before_filter :authorize, :except => [ :index, :login ]
  
  def index
    
  end

  def login
    if params[:password].blank?
      if user = User.find_by_email params[:email]
        # This is a password reset
        
        # Set code (as a uuid) and expires_at (in a day or two) on User
        # Send reset email with coded link to /register/:code
      else
        # This is a registration
        
        # Create a new user with email = email 
        # Send registration email
      end
    else
      if user = User.authenticate(params[:email], params[:password])
        session[:user_id] = user.id
      
        redirect_to root_path
      else
        flash.now.alert = "Invalid email or password"
        render "index"
      end
    end
  end

  def logout
    session[:user_id] = nil
    
    redirect_to root_path
  end
  
  def do_something_naughty
    render :naughty
  end
end
