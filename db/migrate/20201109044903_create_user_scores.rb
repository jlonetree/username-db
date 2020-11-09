class CreateUserScores < ActiveRecord::Migration[6.0]
  def change
    create_table :user_scores do |t|
      t.integer :username_id
      t.integer :score_id

      t.timestamps
    end
  end
end
