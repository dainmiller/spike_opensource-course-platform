# The `Recordable` concern adds a callback that
# auto-creates a `Recording` relationship to the
# class it's included in.
#
# ==== Example
#
# Trigger the chain by creating a record
# that creates a Bucket entity (course, vault)...
#
#   course = Course.create! title: 'Rails Intro'
#     # => <Course id=1, title='Rails Intro'>
#
#   course.bucket.recording
#   Bucket.last.recording
#     # => <Recording id: 1, recordable_id: 1, recordable_type: 'Bucket'>
#
# & if you call...
#
#   Recording.find(1).recordable
#     # => <Bucket id: 1, bucketable_id: 1, bucketable_type: 'Course'>
#
# & then you can continue the chain...
#
#   Recording.find(1).recordable.bucketable
#     # => <Course id=1, title='Rails Intro'>
module Recordable
  extend ActiveSupport::Concern

  included do
    has_one :recording, as: :recordable
    after_create do
      save_with self
    end
  end

  def save_with entity
    Recording.create \
      recordable: entity
  end

end
