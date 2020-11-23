# Class handles user sessions
class SessionsController < ApplicationController

  before_action :set_user

  # Creates a new session for a user
  def create
    user = User.find_by_email! params[:email]

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: %i[id email authentication_token]), status: :created
    else
      head :unauthorized
    end
  end

  # Destroys a session for a user
  def destroy
    if @user
      @user.authentication_token = nil
      if @user.save
        head :destroy
      else
        head :bad_request
      end
    else
      head :unauthorized
    end
  end


  private


  def set_user
    @user = User.find_by_email! params[:email]
  end
end
