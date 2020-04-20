module Commentable
  extend ActiveSupport::Concern
  
  included do
    include Reviewable
    has_many :comments
  end

end