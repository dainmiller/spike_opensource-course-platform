class CreatePolymorphicRelationshipOnBuckets < ActiveRecord::Migration[6.0]
  def change
    remove_column :buckets, :course_id
    remove_column :buckets, :vault_id
    add_column :buckets, :addressable, :reference, polymorphic: true, index: true
  end
end
