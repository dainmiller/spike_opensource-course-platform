class CreatePolymorphicAssociationOnBuckets2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :buckets, :reference
    add_column :buckets, :bucketable_id, :integer
    add_column :buckets, :bucketable_type, :integer
    add_index :buckets, [:bucketable_type, :bucketable_id]
  end
end
