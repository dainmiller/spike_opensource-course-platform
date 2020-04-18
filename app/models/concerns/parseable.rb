module Parseable
  extend ActiveSupport::Concern
  
  included do
    def parse data
      @parsed = JSON.parse data
      return @parsed
    end
  end
  
end