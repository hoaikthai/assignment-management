class SubmissionsController < ApplicationController
	def create
		submission = Submission.new(user_id: params[:user_id],
																assignment_id: params[:assignment_id],
																sub_date: Time.now,
																attachment: params[:attachment],
																group_id: params[:group_id])
		if submission.save
			render json: submission, status: 201
		else
			render json: { error: "Submission error" }, status: 400
		end
	end

	def get_submissions
		submissions = Submission.where("assignment_id = ? and group_id = ?", params[:assignment_id], params[:group_id])
		unless submissions.compact.empty?
			render(
	      json: ActiveModel::ArraySerializer.new(
	        submissions,
	        each_serializer: SubmissionSerializer,
	        root: 'submissions',
	      ),
	      status: 200
	    )
	  else
	   	render json: { error: "Fail to get submissions" }, status: 400
	  end
	end
end
