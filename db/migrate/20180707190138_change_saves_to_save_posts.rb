class ChangeSavesToSavePosts < ActiveRecord::Migration[5.2]
  def change
    rename_table :saves, :save_posts
  end
end
