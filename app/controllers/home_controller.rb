class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:intro, :about]

  def intro
  end

  def about
  end

  def profile
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
end
