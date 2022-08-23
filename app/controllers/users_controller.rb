class UsersController < ApplicationController
  def new
  end

  def show
    binding.pry
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.first
      render :new
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
