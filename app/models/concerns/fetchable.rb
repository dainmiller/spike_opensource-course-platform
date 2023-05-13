module Fetchable
  extend ActiveSupport::Concern

  included do

    def fetch url
      @data ||= HTTParty.get(url).body
      return @data
    end

  end
end
