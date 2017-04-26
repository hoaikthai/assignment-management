class SubmissionsController < ApplicationController
	def create
		submission = Submission.new(user_id: params[:user_id],
																assignment_id: params[:assignment_id],
																sub_date: Time.now,
																attachment: params[:attachment])
		if submission.save
			render json: submission, status: 201
		else
			render json: { error: "Submission error" }, status: 400
		end
	end
end
