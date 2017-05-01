class AssignmentsController < ApplicationController

	def create
		assignment = Assignment.new(assignment_params)
		if assignment.save
			render json: assignment, status: 201
		else
			render json: { error: "Assignment error" }, status: 400
		end
	end

	def get_assignments
		user = User.find_by(id: params[:user_id])
		assignments = Array.new
		if user.role == "student"
			user.groups.each do |g|
				g.assignments.each do |a|
					assignments << a if a.due_date > Time.now
				end
			end	
		elsif user.role == "teacher"
			assignments = Assignment.where("user_id = ?", params[:user_id])
		else
		 	render json: { errors: "User not valid" }, status: 422
		end
		unless assignments.compact.empty?
			render(
	      json: ActiveModel::ArraySerializer.new(
	        assignments,
	        each_serializer: AssignmentSerializer,
	        root: 'assignments',
	      ),
	      status: 200
	    )
	  else
	   	render json: { error: "Fail to get assignments" }, status: 400
	  end
	end

	def destroy
		assignment = Assignment.find(params[:id])
		assignment.submissions.each { |s| s.delete }
		if assignment.delete
			render json: { message: "Delete successfully" }, status: 200
		else
			render json: { error: "Failed to delete assignment" }, status: 400
		end
	end

	private
		def assignment_params
			params.require(:assignment).permit(:subject, :content, :due_date, :attachment, :group_id, :user_id)
		end

end
