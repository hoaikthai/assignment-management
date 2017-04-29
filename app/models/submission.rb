class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  belongs_to :group
  validates :attachment, presence: true
end
