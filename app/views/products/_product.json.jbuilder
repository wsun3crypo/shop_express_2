json.extract! product, :id, :merchants_id, :description, :picture, :price,
              :created_at, :updated_at
json.url product_url(product, format: :json)
