json.extract! merchant, :id, :name, :description, :address, :tel, :picture,
              :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
json.token user.generate_jwt
