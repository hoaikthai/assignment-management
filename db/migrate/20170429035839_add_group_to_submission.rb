class AddGroupToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_reference :submissions, :group, foreign_key: true
  end
end
