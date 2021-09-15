json.extract! loyalty_program, :id, :merchants_id, :customers_id, :created_at,
              :updated_at
json.url loyalty_program_url(loyalty_program, format: :json)
