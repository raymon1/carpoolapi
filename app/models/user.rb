class User < ApplicationRecord
  belongs_to :group
  belongs_to :home_place, class_name: 'Place'
  belongs_to :work_place, class_name: 'Place'
  
end