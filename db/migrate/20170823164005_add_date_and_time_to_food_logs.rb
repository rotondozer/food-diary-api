class AddDateAndTimeToFoodLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :food_logs, :date, :date
    add_column :food_logs, :time, :text
  end
end
