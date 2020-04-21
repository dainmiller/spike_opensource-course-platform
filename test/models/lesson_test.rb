require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  
  test "associations" do
    course = Course.create title: 'not-important'
    track = Track.create course_id: course.id
    assert_predicate track, :lessons
  end
  
  test "lesson valid" do
    lesson_without_track_id = Lesson.new
    lesson_with_track_id = Lesson.new track: Track.create
    assert_equal false, lesson_without_track_id.valid?
    assert_equal true, lesson_with_track_id.valid?
  end
  
  test "fails validation if there is no 'track_id' attribute" do
    assert_raise(ActiveRecord::RecordInvalid) { Lesson.create! }
    track = Track.create course: Course.create(title: 'not important')
    assert Lesson.create! track: track
    assert Lesson.create! track: track
  end

  test "#.save! method raises an error message if saving fails" do
    assert_raise(ActiveRecord::UnknownAttributeError) {
      Lesson.new(thing: 't').save!
    }
  end
  
  
end
