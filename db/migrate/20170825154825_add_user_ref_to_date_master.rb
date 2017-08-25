class AddUserRefToDateMaster < ActiveRecord::Migration[5.0]
  def change
    add_reference :date_masters, :user, foreign_key: true
  end
end
