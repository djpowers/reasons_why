class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.text :body
      t.integer :list_id

      t.timestamps
    end
  end
end
