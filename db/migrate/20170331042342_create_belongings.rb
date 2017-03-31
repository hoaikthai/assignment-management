class CreateBelongings < ActiveRecord::Migration[5.0]
  def change
    create_table :belongings do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
    add_index :belongings, [:user_id, :group_id], unique: true
  end
end
