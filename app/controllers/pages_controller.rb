class PagesController < ApplicationController
  before_action :check_if_logged_in, only: [:home]
  # before_action :check_if_admin, only: [:home]

  def welcome
  end

  def home
  end
end
