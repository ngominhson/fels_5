class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :category_id
      t.string :integer
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
