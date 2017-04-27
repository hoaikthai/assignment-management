class UsersController < ApplicationController

	def show
		if user = User.find(params[:id])
			render json: UserSerializer.new(user).to_json, status: 200
		else
			render json: { errors: "User not found" }, status: 404
		end
	end

	def update
		if user = User.find(params[:id])
			user.name = params[:name] unless params[:name].nil?
			user.gender = params[:gender] unless params[:gender].nil?
			user.address = params[:address] unless params[:address].nil?
			user.birthday = params[:birthday] unless params[:birthday].nil?
			user.save
			render json: UserSerializer.new(user).to_json, status: 200
		else
			render json: { errors: "User not found" }, status: 404
		end
	end

end
