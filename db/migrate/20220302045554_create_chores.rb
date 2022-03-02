class CreateChores < ActiveRecord::Migration[6.1]
  def change
    create_table :chores do |t|
      t.string :name
      t.string :task_time
      t.integer :user_id
      t.integer :category_id
      t.text :description

      t.timestamps
    end
  end
end
