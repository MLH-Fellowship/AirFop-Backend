# Controller for the User model
class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    json_response(@user, :created)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
