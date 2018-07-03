class AddAttachmentsToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :attachments, :string
  end
end
