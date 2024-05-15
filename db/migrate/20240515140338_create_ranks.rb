class CreateRanks < ActiveRecord::Migration[7.0]
  def change
    create_table :ranks do |t|
      t.references :client, index: true
      t.string :name
      t.float :point_rate
      t.integer :color, default: 1
      t.boolean :is_default, default: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
