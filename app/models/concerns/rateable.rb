module Rateable
  extend ActiveSupport::Concern
  
  def rate_with rating
    update! \
      rating: rating
  end
  
end