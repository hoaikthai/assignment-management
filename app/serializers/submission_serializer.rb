class SubmissionSerializer < BaseSerializer
  attributes :id, :user, :assignment_id, :sub_date, :attachment, :score, :group_id

  def sub_date
  	object.sub_date.strftime("%d %b %Y - %H:%M") if object.sub_date
  end

  def user
  	object.user.name
  end
end