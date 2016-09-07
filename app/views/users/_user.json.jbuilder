json.extract! user, :id, :first_name, :last_name, :phone_number, :group_id, :home_place_id, :work_place_id, :created_at, :updated_at
json.url user_url(user, format: :json)