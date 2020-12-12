# Controller for the User model
class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    json_response(@user, :created)
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    head :no_content
  end

  # Gets the User with the associated email
  def user_by_email
    @user = User.where(email: params[:email])
    puts params[:email]
    json_response(@user)
  end

  private

  def user_params
    params.permit(:id, :first_name, :last_name, :email, :password, :is_admin)
  end
end
