class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.belongs_to :bucket, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
