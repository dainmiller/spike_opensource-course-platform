class ChangeTasksTableNameToTracks < ActiveRecord::Migration[6.0]
  def change
    rename_table :tasks, :tracks
  end
end
