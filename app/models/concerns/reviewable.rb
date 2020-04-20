module Reviewable
  extend ActiveSupport::Concern
  
  def reviews
    comments
  end

end