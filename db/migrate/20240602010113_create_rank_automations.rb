class CreateRankAutomations < ActiveRecord::Migration[7.0]
  def change
    create_table :rank_automations do |t|
      t.integer :before_rank_id, index: true
      t.integer :after_rank_id, index: true
      t.integer :automation_type, index: true
      t.integer :value
      t.integer :term
      t.datetime :last_checked_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
