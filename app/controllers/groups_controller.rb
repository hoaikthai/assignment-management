class GroupsController < ApplicationController

	def get_groups
		user = User.find_by(id: params[:user_id])
		if user.role == "teacher"
			belongings = user.belongings
			groups = Array.new
			belongings.each { |b| groups << Group.find_by(id: b.group_id) }
			render json: groups, status: 200
		else
			render json: { errors: "User not valid" }, status: 422
		end
	end
end
