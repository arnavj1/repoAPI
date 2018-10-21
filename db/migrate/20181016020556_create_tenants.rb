class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :phone
      t.string :username
      t.string :password_digest
      t.boolean :active, default: true


      t.timestamps
    end
  end
end
