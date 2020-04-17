module Effort
  extend ActiveSupport::Concern
  
  def estimate_effort effort
    update! \
      effort: effort
  end
  
end