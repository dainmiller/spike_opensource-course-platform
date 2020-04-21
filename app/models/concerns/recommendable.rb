module Recommendable
  extend ActiveSupport::Concern
  
  included do
    has_one :recommendation, as: :recommendable
  end
end