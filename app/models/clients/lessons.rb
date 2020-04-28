module Clients
  class Lessons < ApiClient
    
    attr_accessor :response, :track
    
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
        save_record!(
          belongs_to: @track,
          callback_with: Clients::DataLoader::LessonLoader
        )
      end
  end
end