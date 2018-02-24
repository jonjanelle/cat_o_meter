class CatsController < ApplicationController

  def edit_profiles
    @user = current_user
    if @user.blank?
      flash[:alert] = "You must sign-in to create or edit cat profiles."
      redirect_to root_path and return
    end
    @cats = @user.cats
  end

  def create_rating
  end

end
