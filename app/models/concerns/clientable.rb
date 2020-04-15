module Clientable
  extend ActiveSupport::Concern
  
  include Fetchable, Parseable, Cacheable
  
  included do
    
    def fetch_and_parse url
      parse fetch url
    end
    
    def cache_and_fetch url
      cache fetch url unless file_exists?
    end
    
    def cache_and_fetch_and_parse url
      cache_and_fetch url ; parse File.read('org.json')
    end
    
  end
end