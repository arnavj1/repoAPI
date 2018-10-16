class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.string :title
      t.string :description
      t.date :created_on
      t.date :removed_on

      t.timestamps
    end
  end
end
