class Group < ApplicationRecord
	has_many :users
	validates :name, uniqueness: true, presence: true

end
