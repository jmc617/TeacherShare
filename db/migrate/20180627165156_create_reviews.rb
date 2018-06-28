class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :product
      t.string :content
      t.integer :teacher_id
      t.timestamps
    end
  end
end
