class GroupsController < ApplicationController

	def get_groups
		user = User.find_by(id: params[:user_id])
		if user.role == "teacher"
			render(
      json: ActiveModel::ArraySerializer.new(
        user.groups,
        each_serializer: GroupSerializer,
        root: 'groups',
      ),
      status: 200
    )
		else
			render json: { errors: "User not valid" }, status: 422
		end
	end
end
