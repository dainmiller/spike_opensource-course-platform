class ChangeColumnTypeToRecordingsTypeOnRecordings2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :recordings, :type
    add_column :recordings, :recording_type, :string
  end
end
