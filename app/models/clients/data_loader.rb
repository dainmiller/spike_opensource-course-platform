module Clients
  module Data
    
    class CourseLoader < ApiClient
      def self.data course
        contents.each do |track|
          Clients::Track.new(
            response: track, course: course
          ).save!
        end
      end
    end
    
    class TrackLoader < ApiClient
      def self.data track
        contents.each do |lesson|
          Clients::Lessons::Lesson.new(
            response: lesson, track: track
          ).save!
        end
      end
    end
    
    class LessonLoader < ApiClient
      def self.data lesson
        data = fetch_and_parse lesson.url.split('?')[0]
        encoded_content = data.fetch 'content'
        lesson.update! body: encoded_content
      end
    end  

  

end