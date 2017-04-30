class SubmissionsController < ApplicationController
	def create
		submission = Submission.new(submission_params)
		if Submission.find_by(user_id: submission.user_id, assignment_id: assignment_id).nil?
			if submission.save
				submission.update_attributes(sub_date: Time.now)
				render json: submission, status: 201
			else
				render json: { error: "Submission error" }, status: 400
			end
		else
			render json: { error: "Cannot submit 2 times "}, status: 200
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

	def destroy
		submission = Submission.find_by(user_id: params[:user_id], assignment_id: params[:assignment_id])
		submission.delete unless submission.nil?
	end

	private
		def submission_params
			params.require(:submission).permit(:user_id, :assignment_id, :attachment, :group_id)
		end
end
