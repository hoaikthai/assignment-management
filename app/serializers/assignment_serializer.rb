class AssignmentSerializer < BaseSerializer
  attributes :id, :subject, :content, :due_date, :attachment, :group_id, :user_id

  def due_date
  	object.due_date.strftime("%d %b %Y - %H:%M") if object.due_date
  end
end