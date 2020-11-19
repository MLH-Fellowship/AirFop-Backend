# Class handles user sessions
class SessionsController < ApplicationController

  def create
    user = User.find_by_email! params[:email]

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: %i[id email]), status: :created
    else
      head :unauthorized
    end
  end
end
