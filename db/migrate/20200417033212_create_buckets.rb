class CreateBuckets < ActiveRecord::Migration[6.0]
  def change
    create_table :buckets do |t|
      t.belongs_to :course, null: true, foreign_key: true
      t.belongs_to :vault, null: true, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
