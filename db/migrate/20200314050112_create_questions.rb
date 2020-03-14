class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :topic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
