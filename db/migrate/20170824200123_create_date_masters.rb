class CreateDateMasters < ActiveRecord::Migration[5.0]
  def change
    create_table :date_masters do |t|
      t.date :date

      t.timestamps
    end
  end
end
