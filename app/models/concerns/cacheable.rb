module Cacheable
  extend ActiveSupport::Concern
  
  included do

    def cache data
      File.open('org.json', 'w') { |file| 
        file.write(data) 
      }
    end
    
    def file_exists?
      not File.read('org.json').empty?
    end
    
  end
end