class CreateMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenances do |t|
      t.string :title
      t.string :description
      t.string :photo
      t.date :created_on
      t.date :closed_on
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
