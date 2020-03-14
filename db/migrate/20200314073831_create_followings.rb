class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.integer :user_id
      t.string :follower_type
      t.integer :follower_type_id

      t.timestamps
    end
  end
end
