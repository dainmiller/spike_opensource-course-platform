require 'test_helper'

class CourseTest < ActiveSupport::TestCase
    
  test "belongs_to :vault association" do
    course = Course.create
    assert course.respond_to? :vault
  end
  
  test "has_many :recordings association" do
    course = Course.create
    assert_predicate course, :recordings
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

  test "calls Recordable.for after the creation of a course object" do
    course = Course.create(title: 'test')
    assert_not_nil Recording.last
    assert_equal 'course', Recording.last.type
  end
  
end