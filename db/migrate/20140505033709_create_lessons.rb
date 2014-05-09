class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :category_id
      t.string :result
      t.string :user_id
      t.integer :number_questions

      t.timestamps
    end
  end
end
