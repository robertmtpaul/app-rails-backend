class PagesController < ApplicationController
  # TODO : re-enable check once redirecting non-logged in users... 
  # before_action :check_if_logged_in, only: [:welcome]
  # before_action :check_if_admin, only.... 
  def welcome


  end

  def home
    check_if_logged_in
    #
  end
end
