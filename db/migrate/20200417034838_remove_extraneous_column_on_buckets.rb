class RemoveExtraneousColumnOnBuckets < ActiveRecord::Migration[6.0]
  def change
    remove_column :buckets, :addressable
  end
end
