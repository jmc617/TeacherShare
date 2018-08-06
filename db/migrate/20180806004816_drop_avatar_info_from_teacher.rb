class DropAvatarInfoFromTeacher < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :teachers, :avatar
    remove_column :teachers, :avatar_file_name, :string
    remove_column :teachers, :avatar_content_type, :string
    remove_column :teachers, :avatar_file_size, :integer
    remove_column :teachers, :avatar_updated_at, :datetime
  end
end
