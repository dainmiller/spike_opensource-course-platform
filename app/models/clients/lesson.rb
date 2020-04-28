module Clients
  module Lessons
    class Lesson < ApiClient

      SETTINGS = {
        :table => Lesson
      }

      def initialize response:, track:
        @response = response
        @track    = track
        super
      end

      private
        def save_record
          super \
            belongs_to: @track,
            callback_with: Clients::Data::LessonLoader.data
        end
    end
  end
end
