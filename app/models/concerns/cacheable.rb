module Cacheable
  extend ActiveSupport::Concern
  
  included do

    def cache data
      File.open('org.json', 'w') { |file| 
        file.write(data) 
      }
    end
    
    def file_exists?
      begin File.read('org.json')
        true
      rescue
        false
      end
    end
    
  end
end