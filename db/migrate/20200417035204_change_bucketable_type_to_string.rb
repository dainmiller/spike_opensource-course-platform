class ChangeBucketableTypeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :buckets, :bucketable_type, :string
  end
end
