class CreateRankRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :rank_records do |t|
      t.references :user, index: true
      t.integer :before_rank_id, index: true
      t.integer :after_rank_id, index: true
      t.datetime :changed_at
      t.string :changerable_type
      t.integer :changerable_id, index: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
