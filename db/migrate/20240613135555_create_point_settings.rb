class CreatePointSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :point_settings do |t|
      t.references :client, index: true
      t.boolean :is_valid, default: false
      t.string :original_name
      t.float :rate, default: 0.0
      t.integer :valid_days, default: 0
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
