require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @course   = Course.create! title: 'not important'
    @comment  = @course.bucket.comments.create! \
      body: "This is a comment, but the body isn't important"
  end
  
  def test_comment_validity
    @comment.valid?
  end

  def test_no_bucket_no_comment
    assert_raise(ActiveRecord::RecordInvalid) { 
      Comment.create!
    }    
  end
  
  def test_comment_created_success
    comment = Comment.create! \
      bucket: Bucket.last, body: 'comment'
    assert_equal 'comment', comment.body
  end

  def test_comment_linked_to_bucket
    bucket_id = Bucket.last.id
    assert @comment.bucket
    assert_equal @comment.bucket.id, bucket_id
  end

  def test_comments_on_course_via_proxy
    assert_predicate @course, :comments
    assert_equal @course.comments, @course.bucket.comments    
  end
  
  def test_comments_on_course_through_bucket
    assert @course.comments
  end
  
  def test_review_acts_as_comment_via_inheritance
    assert Review.create! bucket: Bucket.last
    assert_equal @course.bucket.comments, @course.bucket.reviews
    assert_equal @course.comments, @course.reviews
  end
  
end