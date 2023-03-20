json.extract! voucher, :id, :business_name, :business_identifier, :timbrado, :number, :date, :total_amount, :created_at, :updated_at
json.url voucher_url(voucher, format: :json)
