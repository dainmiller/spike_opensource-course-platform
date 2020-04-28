module Clients
  module DataLoader

    class CourseLoader
      def self.data course=nil, contents=nil
        if contents
          contents.each do |track|
            Clients::Track.new(
              response: track, course: course
            ).save!
          end
        end
      end
    end

    class TrackLoader
      def self.data track=nil, contents=nil
        if contents
          contents.each do |lesson|
            Clients::Lessons::Lesson.new(
              response: lesson, track: track
            ).save!
          end
        end
      end
    end

    class LessonLoader
      def self.data lesson=nil, contents=nil
        puts lesson
        if lesson
          data = fetch_and_parse lesson.url.split('?')[0]
          encoded_content = data.fetch 'content'
          lesson.update! body: encoded_content
        end
      end
    end

  end

end
