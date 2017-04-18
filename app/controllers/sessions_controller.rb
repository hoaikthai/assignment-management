class SessionsController < ApplicationController

	def new
	end

  def create
  	user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      render json: { user: user }, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end
end
