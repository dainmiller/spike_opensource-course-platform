module Rateable
  extend ActiveSupport::Concern
  
  def rate_with rating
    self.update \
      rating: rating
  end
  
end