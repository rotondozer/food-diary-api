class CreateFoodLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :food_logs do |t|
      t.date :date
      t.time :time
      t.text :description
      t.integer :calories

      t.timestamps
    end
  end
end
