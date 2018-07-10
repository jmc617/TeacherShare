class AddRequestToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :request, :boolean
  end
end
