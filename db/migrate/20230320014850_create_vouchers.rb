class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :business_name
      t.string :business_identifier
      t.string :timbrado
      t.string :number
      t.date :date
      t.bigint :total_amount

      t.timestamps
    end
  end
end
