class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.string :content
      t.integer :teacher_id
      t.integer :post_id
      t.timestamps
    end
  end
end
