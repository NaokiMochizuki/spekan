class CreateClientUserItems < ActiveRecord::Migration[7.0]
  def change
    create_table :client_user_items do |t|
      t.references :client, index: true
      t.references :user_item, index: true
      t.boolean :required, default: false
      t.string :help_text
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
