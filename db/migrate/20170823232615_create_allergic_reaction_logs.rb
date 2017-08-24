class CreateAllergicReactionLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :allergic_reaction_logs do |t|
      t.date :date
      t.text :time
      t.text :symptom

      t.timestamps
    end
  end
end
