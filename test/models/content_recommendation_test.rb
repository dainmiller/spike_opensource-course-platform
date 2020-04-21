require 'test_helper'

class ContentRecommendationTest < ActiveSupport::TestCase
  
  def test_relationships_set_up
    user = User.create
    bucket = Bucket.create
    ContentRecommendation.create recommendable: bucket
    assert user.content_recommendations
    assert ContentRecommendation.count, 1
  end
end