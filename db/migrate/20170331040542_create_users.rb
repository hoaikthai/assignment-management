class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :address
      t.date :birthday
      t.string :role

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
