class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :addr_line1
      t.string :addr_line2
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :rent
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
