class CreatePointRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :point_records do |t|
      t.references :user, index: true
      t.integer :record_type, index: true
      t.integer :value
      t.string :eventable_type, index: true
      t.integer :eventable_id, index: true
      t.timestamps
    end
  end
end
