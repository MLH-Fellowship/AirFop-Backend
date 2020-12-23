# Class handles user sessions
class SessionsController < ApplicationController

  require 'jwt'

  # Creates a new session for a user
  def create
    hmac_secret = 'ThisIsASecret'
    @user = User.find_by_email! params[:email]
    if @user&.valid_password?(params[:password])
      payload = @user.as_json(only: %i[first_name last_name email authentication_token])
      token = JWT.encode payload, hmac_secret, 'HS256'
      token_hash = { token: token}
      json_response(token_hash, :created)
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
