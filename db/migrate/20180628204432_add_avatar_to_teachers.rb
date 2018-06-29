class AddAvatarToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :avatar, :string
  end
end
