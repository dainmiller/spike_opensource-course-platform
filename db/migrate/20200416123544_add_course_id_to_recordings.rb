class AddCourseIdToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_reference :recordings, :course, null: true, foreign_key: true
  end
end
