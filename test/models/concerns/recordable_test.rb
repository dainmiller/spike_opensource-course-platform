require 'test_helper'

class RecordableTest < ActiveSupport::TestCase

  test "creates a recording after the creation of a related object" do
    course = Course.create title: 'not-important'
    assert_not_nil Recording.last
    assert_equal 'Bucket', Recording.last.recordable_type
  end
  
end