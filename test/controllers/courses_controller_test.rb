require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  
  def setup
    @course ||= Course.create title: 'not-important'
  end
  
  def test_index
    get :index
    assert_response 200
    assert_includes response.body, @course.title
  end
  
end