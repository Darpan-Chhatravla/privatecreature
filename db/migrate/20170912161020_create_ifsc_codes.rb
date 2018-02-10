class CreateIfscCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :ifsc_codes do |t|
      t.string  :bank,          limit: 255
      t.string  :ifsc_number,   limit: 100
      t.string  :micr,          limit: 100
      t.string  :branch,        limit: 255
      t.text    :address
      t.string  :contact,       limit: 20
      t.string  :city,          limit: 100
      t.string  :district,      limit: 100
      t.string  :state,         limit: 100

      t.timestamps
    end
    add_index :ifsc_codes, :ifsc_number
    add_index :ifsc_codes, :bank
    add_index :ifsc_codes, :branch
  end
end
