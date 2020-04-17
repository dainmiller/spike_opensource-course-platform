require 'test_helper'

class CourseTest < ActiveSupport::TestCase
    
  test "belongs_to :vault association" do
    course = Course.create
    assert course.respond_to? :vault
  end
  
  test "has_one :bucket association" do
    course = Course.create! title: 't'
    assert course.bucket
  end

  test "fails validation if there is no 'title' attribute" do
    course_without_title = Course.new
    assert_raise(ActiveRecord::RecordInvalid) { c = Course.create! }
    assert_equal false, course_without_title.valid?
  end
  
  test "#.save! method raises an error message if saving fails" do
    assert_raise(ActiveRecord::UnknownAttributeError) { 
      Course.new(thing: 't').save!
    }
  end
  
end