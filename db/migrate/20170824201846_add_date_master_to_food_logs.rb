class AddDateMasterToFoodLogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :food_logs, :date_master, foreign_key: true
  end
end
