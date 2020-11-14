# Controller for the User model
class UsersController < ApplicationController

  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.email = @user.email.downcase
    @user.save!
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  # Used to allow mass assignment
  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
