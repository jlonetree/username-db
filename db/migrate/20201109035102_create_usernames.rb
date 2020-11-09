class CreateUsernames < ActiveRecord::Migration[6.0]
  def change
    create_table :usernames do |t|
      t.string :name
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
