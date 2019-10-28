json.extract! user_detail, :id, :name, :description, :user_id, :location_id, :shopping_cart_id, :type, :created_at, :updated_at
json.url user_detail_url(user_detail, format: :json)
