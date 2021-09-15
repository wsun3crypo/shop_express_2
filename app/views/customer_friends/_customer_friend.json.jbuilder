json.extract! customer_friend, :id, :sender_id, :receiver_id, :created_at,
              :updated_at
json.url customer_friend_url(customer_friend, format: :json)
