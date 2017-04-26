class AssignmentsController < ApplicationController

	def create
		assignment = Assignment.new(subject: params[:subject],
																content: params[:content],
																due_date: params[:due_date],
																attachment: params[:attachment],
																group_id: params[:group_id])
		if assignment.save
			render json: assignment, status: 201
		else
			render json: { error: "Assignment error" }, status: 400
		end
	end

	def destroy
		assignment = Assignment.find_by(id: params[:assignment_id])
		assignment.delete
		render json: { message: "Delete successfully" }, status: 200
	end

end
