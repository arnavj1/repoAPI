class CreateLandlords < ActiveRecord::Migration[5.1]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :phone
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
