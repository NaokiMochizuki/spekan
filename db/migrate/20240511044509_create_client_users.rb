class CreateClientUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :client_users do |t|
      t.references :client, index: true
      t.string :name
      t.string :name_kana
      t.string :email
      t.text :password_digest
      t.integer :role
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
