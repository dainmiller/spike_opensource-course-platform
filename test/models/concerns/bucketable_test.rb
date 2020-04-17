require 'test_helper'

class BucketableTest < ActiveSupport::TestCase

  test "creates a bucket after the creation of a related object" do
    course = Course.create title: 'not-important'
    assert_not_nil Bucket.last
    assert_equal 'Course', Bucket.last.bucketable_type  
  end
  
end