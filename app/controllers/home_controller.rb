class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about]
  def intro
  end

  def about
  end
end
