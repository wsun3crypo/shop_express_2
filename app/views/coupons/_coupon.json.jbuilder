json.extract! coupon, :id, :merchants_id, :amount, :expiry_date, :created_at,
              :updated_at
json.url coupon_url(coupon, format: :json)
