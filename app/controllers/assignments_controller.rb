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
			render json: { errors: "Assignment error" }, status: 400
		end
	end

end
