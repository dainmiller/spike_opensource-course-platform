require 'test_helper'

class CourseRecommenderTest < ActiveSupport::TestCase

  def test_testing
    thing = 1
    thingg = 2
    thingg3 = 3
    
    assert_not_equal(thing, thingg)
  end
  
  def test_creates_a_recommendation
    user = User.create
    course = Course.create

    CourseRecommender.new(
      user: user,
      recommendable_courses: [course]
    ).recommend

    assert_equal 1, ContentRecommendation.count
  end

  def test_enqueues_email_job
    user = User.create
    course = Course.create

    # auto-creates assertion that this is called exactly once
    mailer_job = CourseRecommendationMailerJob
      .expects(:perform_later)
      .with(user.id, course.id)

    CourseRecommender.new(
      user: user,
      recommendable_courses: [course]
    ).recommend

    assert mailer_job
  end

  def test_doesnt_create_a_recommendation_if_no_course
    user = User.create
    CourseRecommender.new(
      user: user,
      recommendable_courses: []
    ).recommend

    assert_equal 0, ContentRecommendation.count
  end

  def test_doesnt_enqueue_a_recommendation_mailer_if_no_course
    user = User.create
    course = Course.create

    # auto-creates assert that this is never called
    mailer_job = CourseRecommendationMailerJob
      .expects(:perform_later)
      .with(user.id, course.id)
      .never

    CourseRecommender.new(
      user: user,
      recommendable_courses: []
    ).recommend

    assert mailer_job
  end

end
