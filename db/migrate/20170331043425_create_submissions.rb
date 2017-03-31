class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.references :user, foreign_key: true
      t.references :assignment, foreign_key: true
      t.datetime :sub_date
      t.integer :score
      t.binary :attachment, :limit => 10.megabyte

      t.timestamps
    end
  end
end
