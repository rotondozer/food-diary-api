class AddDateTimeToFoodLog < ActiveRecord::Migration[5.0]
  def change
    add_column :food_logs, :date_time, :datetime
  end
end
