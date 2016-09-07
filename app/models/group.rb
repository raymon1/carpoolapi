class Group < ApplicationRecord
	validates :name, uniqueness: true, presence: true
end
