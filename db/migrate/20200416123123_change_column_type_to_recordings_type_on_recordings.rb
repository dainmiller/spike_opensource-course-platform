class ChangeColumnTypeToRecordingsTypeOnRecordings < ActiveRecord::Migration[6.0]
  def change
    remove_column :recordings, :type
    add_column :recordings, :type, :string
  end
end
