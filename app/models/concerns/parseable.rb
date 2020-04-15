module Parseable
  extend ActiveSupport::Concern
  
  included do
    
    def parse data
      JSON.parse data
    end
    
  end
  
end