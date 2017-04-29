class Group < ApplicationRecord
	has_many :belongings
	has_many :users, through: :belongings
	has_many :submissions
	has_many :assignments
	validates :group_name, presence: true
end
