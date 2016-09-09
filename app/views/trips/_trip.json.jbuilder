json.extract! trip, :id, :driver_id, :source_id, :destination_id, :departure_time, :seats, :created_at, :updated_at
json.url trip_url(trip, format: :json)