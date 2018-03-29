json.extract! customer, :id, :name, :fone, :description, :created_at, :updated_at
json.url customer_url(customer, format: :json)
