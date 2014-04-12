class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :subject_a, null: false
      t.string :subject_b, null: false
      t.string :adjective, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
