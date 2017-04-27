class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  validates :attachment, presence: true
end
