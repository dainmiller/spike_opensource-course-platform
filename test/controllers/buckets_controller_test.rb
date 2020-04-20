require 'test_helper'

class BucketsControllerTest < ActionController::TestCase
  
  def setup
    @course = Course.create title: 'not-important'
  end
  
  def test_search_result_title_matches
    get :search, params: { for: 'not-important' }, format: :json
    assert_response 200
    assert_includes response.body, @course.title
  end
  
  def test_search_result_doesnt_match
    get :search, params: { for: 'will not match' }, format: :json
    assert_response 200
    assert_equal(response.body, "[]")
  end
  
end