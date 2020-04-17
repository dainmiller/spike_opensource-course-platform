# The `Bucketable` concern adds a callback 
# that auto-creates a `Bucket` relationship
# to the class it's included in.
#
# ==== Example
#
#   course = Course.create! title: 'Rails Intro'
#     # => <Course id=1, title='Rails Intro'>
#
#   course.bucket
#     # => <Bucket id: 1, bucketable_id: 1, bucketable_type: 'Course'>
#
#   Bucket.find(1).bucketable
#     # => <Course id=1, title='Rails Intro'>
#
module Bucketable
  extend ActiveSupport::Concern
  
  included do
    has_one :bucket, as: :bucketable
    after_create do
      save_with self
    end
  end
  
  def save_with entity
    Bucket.create \
      bucketable: entity
  end
end