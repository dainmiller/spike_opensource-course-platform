class AddTimestampsToRecordiings < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :recordings, null: true
  end
end
