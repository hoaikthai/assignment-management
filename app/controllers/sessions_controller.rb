class SessionsController < ApplicationController

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      render json: user, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end
end
