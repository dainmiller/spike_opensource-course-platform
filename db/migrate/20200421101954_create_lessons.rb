class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
