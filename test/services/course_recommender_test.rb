require 'test_helper'

class CourseRecommenderTest < ActiveSupport::TestCase
  
  def test_creates_a_recommendation
    user = User.create
    course = Course.create
    
    CourseRecommender.new(
      user: user,
      recommendable_courses: [course]
    ).recommend
    
    assert_equal 1, ContentRecommendation.count
  end
  
end 