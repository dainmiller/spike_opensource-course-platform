class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :course, null: false, foreign_key: true
      t.text :title

      t.timestamps
    end
  end
end
