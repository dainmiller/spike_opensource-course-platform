module Clientable
  extend ActiveSupport::Concern
  
  include Fetchable, Parseable, Cacheable
  
  included do
    
    def fetch_and_parse url
      parse fetch url
    end
    
    def fetch_and_cache url
      cache fetch url unless file_exists?
    end
    
    def fetch_and_parse_and_cache url
      fetch_and_cache url ; parse File.read('org.json')
    end

  end
end