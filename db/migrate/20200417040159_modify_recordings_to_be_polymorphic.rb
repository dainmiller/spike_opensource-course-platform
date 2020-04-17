class ModifyRecordingsToBePolymorphic < ActiveRecord::Migration[6.0]
  def change
    remove_column :recordings, :recording_type
    remove_column :recordings, :course_id
    add_column :recordings, :recordable_id, :integer
    add_column :recordings, :recordable_type, :string
    add_index :recordings, [:recordable_type, :recordable_id]
  end
end
