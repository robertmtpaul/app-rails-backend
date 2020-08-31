class ApplicationController < ActionController::Base
    
    before_action :fetch_user
    # Check if logged in before running actions on any controller

    def fetch_user
    #CHeck whether user_id in session is ID

      if session[:user_id].present?
        @current_user = User.find_by id: session[:user_id]
      end
      # if we did get nil from above query, delete the session   
      session[:user_id] = nil unless @current_user.present?
    end #fetch_user

    def is_admin?
      # Check if ths user logging in is an administrator

      redirect_to(root_path) unless @current_user.try(:admin)
    end


    def check_if_logged_in
      redirect_to login_path unless @current_user.present?
    end
end