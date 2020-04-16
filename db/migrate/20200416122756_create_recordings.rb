class CreateRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings do |t|
      t.string :type
      t.string :status
    end
  end
end
