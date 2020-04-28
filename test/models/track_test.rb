require 'test_helper'

class TrackTest < ActiveSupport::TestCase

  test "associations" do
    assert Course.create.tracks
    assert_predicate Course.create, :tracks
  end

  test "track valid" do
    track_without_course_id = Track.new
    track_with_course_id = Track.new course: Course.create
    assert_equal false, track_without_course_id.valid?
    assert_equal true, track_with_course_id.valid?
  end

  test "fails validation if there is no 'course_id' attribute" do
    assert_raise(ActiveRecord::RecordInvalid) { Track.create! }
    assert Track.create! course: Course.create(title: 'not important')
    assert Track.create! course: Course.create(title: 'not important')
  end

  test "#.save! method raises an error message if saving fails" do
    assert_raise(ActiveRecord::UnknownAttributeError) {
      Track.new(thing: 't').save!
    }
  end

end
