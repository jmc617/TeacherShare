class RemoveAvatarFromTeachers < ActiveRecord::Migration[5.2]
  def change
    # remove_column :teachers, :avatar, :string
    add_column :teachers, :attachments, :string
  end
end
