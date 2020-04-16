class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.belongs_to :vault
      t.string :title
      t.string :status
      t.text :description
      t.string :topic
      t.string :url

      t.timestamps
    end
  end
end
