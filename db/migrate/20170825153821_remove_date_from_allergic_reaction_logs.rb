class RemoveDateFromAllergicReactionLogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :allergic_reaction_logs, :date, :date
  end
end
