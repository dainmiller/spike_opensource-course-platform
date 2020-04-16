module Bucketable
  extend ActiveSupport::Concern
  
  included do
    has_many :buckets, as: :bucketable
  end
  
  def self.save
    Bucket.create \
      type: entity.class.table_name
  end
end