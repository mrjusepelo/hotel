class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.references :reserve, foreign_key: true
      t.float :room_value
      t.float :minibar_value
      t.float :discount
      t.float :total

      t.timestamps
    end
  end
end
