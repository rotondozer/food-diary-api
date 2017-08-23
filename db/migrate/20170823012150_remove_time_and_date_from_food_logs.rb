class RemoveTimeAndDateFromFoodLogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :food_logs, :date, :date
    remove_column :food_logs, :time, :time
  end
end
