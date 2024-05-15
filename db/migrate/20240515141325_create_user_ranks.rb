class CreateUserRanks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_ranks do |t|
      t.references :user, index: true
      t.references :rank, index: true
      t.timestamps
    end
  end
end
