class CreateUserItems < ActiveRecord::Migration[7.0]
  def change
    create_table :user_items do |t|
      t.string :name
      t.integer :format, index: true
      t.boolean :is_default, default: false
      t.references :client, index: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
