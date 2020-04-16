require 'test_helper'

class CourseTest < ActiveSupport::TestCase
    
  test "belongs_to :vault association" do
    course = Course.create
    assert course.respond_to? :vault
  end
  
  test "#.save! method raises an error message if saving fails" do
    Clients::Github.all.each do |repo|
      assert_raise(ActiveRecord::UnknownAttributeError) { 
        Course.new(thing: 't').save!
      }
    end
  end

end
