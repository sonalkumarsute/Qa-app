class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.string :follower_type
      t.integer :follower_type_id

      t.timestamps
    end
  end
end
