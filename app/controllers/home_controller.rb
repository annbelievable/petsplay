class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:intro, :about]

  def intro
  end

  def about
  end

  def profile
    @user = current_user
  end
end
