json.extract! status, :id, :sold, :date_sold, :date_listed, :view_count, :user_id, :created_at, :updated_at
json.url status_url(status, format: :json)
