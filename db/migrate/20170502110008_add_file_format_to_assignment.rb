class AddFileFormatToAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :file_format, :string
  end
end
