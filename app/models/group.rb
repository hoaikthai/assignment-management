class Group < ApplicationRecord
	has_many :belongings
	has_many :assignments
end
