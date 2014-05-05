class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :word_id
      t.string :answer
      t.boolean :is_correct

      t.timestamps
    end
  end
end
