class Comment < ApplicationRecord

  # Comments flows through buckets, which allow
  # us to add comments to things like courses,
  # lessons, etc.
  #
  # ==== Example
  #
  #   course = Course.create! title: 't'
  #   course.bucket.comments.create! body: 't'
  #     # => <Comment id=1 body='t'>
  #   Comment.find(1).bucket.bucketable
  #     # => <Course id=1>
  belongs_to :bucket
end
