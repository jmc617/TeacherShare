class CreateReviewComments < ActiveRecord::Migration[5.2]
  def change
    create_table :review_comments do |t|
      t.string :content
      t.integer :teacher_id
      t.integer :review_id
      t.timestamps
    end
  end
end
