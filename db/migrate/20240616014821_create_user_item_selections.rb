class CreateUserItemSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :user_item_selections do |t|
      t.references :user_item, index: true
      t.string :name
      t.integer :order
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
