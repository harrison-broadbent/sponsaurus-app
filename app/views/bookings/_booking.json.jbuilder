json.extract! booking, :id, :references, :created_at, :updated_at
json.url booking_url(booking, format: :json)
