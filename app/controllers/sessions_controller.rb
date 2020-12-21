# Class handles user sessions
class SessionsController < ApplicationController

  # Creates a new session for a user
  def create
    @user = User.find_by_email! params[:email]
    if @user&.valid_password?(params[:password])
      render json: @user.as_json(only: %i[first_name last_name email authentication_token]), status: :created
    else
      head :unauthorized
    end
  end

  # Destroys a session for a user
  def destroy
    @user = User.find_by authentication_token: params[:authentication_token]
    if @user
      @user.authentication_token = nil
      @user.save
      head :accepted
    else
      head :unauthorized
    end
  end
end
