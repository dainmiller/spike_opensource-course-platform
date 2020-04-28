module Clients
  module Lessons
    module Lesson
      class Data < ApiClient
        include Decodable, Clientable
  
        attr_reader :readable, :decoded_content, :encoded_content
  
        delegate :decoded_content, to: :readable
  
        def initialize response:
          @response = response
          super
        end
  
        def content
          @encoded_content ||= fetch_and_parse response.fetch('url')
        end
  
        # This is mostly a decorator method to read this from the UI
        def readable
          decode @response
        end
  
      end
    end
  end
end