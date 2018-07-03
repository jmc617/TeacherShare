class RemoveAvatarfromTeachers < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :attachments, :string
  end
end
