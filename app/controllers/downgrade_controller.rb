class DowngradeController < ApplicationController

  def new
  end

  def create
  @user = current_user
  @user.role = 'standard'

    if @user.save
      flash[:notice] = "You've been downgraded to standard. Your private wikis are now public."
      redirect_to root_path
    else
      flash[:error] = "There was an error downgrading your account. Please try again."
      redirect_to root_path
    end
  end

end
