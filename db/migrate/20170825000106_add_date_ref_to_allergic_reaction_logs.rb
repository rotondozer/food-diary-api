class AddDateRefToAllergicReactionLogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :allergic_reaction_logs, :date_master, foreign_key: true
  end
end
