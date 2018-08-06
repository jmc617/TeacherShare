class AddAvatarToTeachers < ActiveRecord::Migration[5.2]
  def self.up
    add_attachment :teachers, :avatar
  end

  def self.down
    remove_attachment :teachers, :avatar
  end
end
