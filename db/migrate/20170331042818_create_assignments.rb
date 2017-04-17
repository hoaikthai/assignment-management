class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :subject
      t.text :content
      t.datetime :due_date
      t.binary :attachment, :limit => 10.megabyte
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
