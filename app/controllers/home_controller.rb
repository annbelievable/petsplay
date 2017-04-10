class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:intro, :about]

  def intro
  end

  def about
  end

  def profile
    @user = current_user
  end

  def approve_booking
    byebug
    booking = Match.find(params[:match_id])
    booking.update(match: true)
    redirect_to profile_path
  end

  def reject_booking
    booking = Match.find(params[:match_id])
    booking.update(match: false)
    redirect_to profile_path
  end

end
