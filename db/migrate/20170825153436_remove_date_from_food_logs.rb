class RemoveDateFromFoodLogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :food_logs, :date, :date
  end
end
