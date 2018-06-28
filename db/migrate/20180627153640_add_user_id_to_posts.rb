class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :group_id, :integer
    add_column :posts, :teacher_id, :integer
  end
end
