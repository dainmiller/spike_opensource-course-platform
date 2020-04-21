class RemoveTaskFromLessons < ActiveRecord::Migration[6.0]
  def change
    change_table :lessons do |t|
       t.remove_references :task
     end
  end
end
