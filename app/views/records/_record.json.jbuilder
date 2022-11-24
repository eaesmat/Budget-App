json.extract! record, :id, :user_id, :name, :amount, :created_at, :updated_at
json.url record_url(record, format: :json)
