class User < ApplicationRecord
  belongs_to :group
  belongs_to :home_place, class_name: 'Place'
  belongs_to :work_place, class_name: 'Place'
  validates :home_place_id, :work_place_id, :group_id, :first_name, :last_name, presence: true
end