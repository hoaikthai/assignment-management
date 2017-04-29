class SubmissionSerializer < BaseSerializer
  attributes :id, :user_id, :assignment_id, :sub_date, :attachment, :score, :group_id

  def sub_date
  	object.due_date.strftime("%d %b %Y - %H:%M") if object.due_date
  end
end