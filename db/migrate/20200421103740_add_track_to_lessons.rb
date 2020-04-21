class AddTrackToLessons < ActiveRecord::Migration[6.0]
  def change
    change_table :lessons do |t|
     t.belongs_to :track
   end
  end
end
