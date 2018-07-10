class CreateSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|

      t.integer :teacher_id
      t.integer :post_id

      t.timestamps
    end
  end
end
