# Formats the repository data from github into a class's attributes.
#
# ==== Options
#
# * <tt>:response</tt> - The JSON data directly from Github
# * <tt>:course</tt> - The course db object to build the track relationship
#
# ==== Examples
#
#   Clients::Repo.new({}) # => <Clients::RepoClass @response>
#
class Clients::Track < ApiClient
  include Clientable
  
  SETTINGS = {
    :table => Track
  }
  
  def initialize response:, course:
    @response = response
    @course   = course
    super
  end
  
  private
    def _save
      @track ||= table.find_or_create_by \
        course_id: @course.id, title: title, url: url
      lazy_load_track_contents
    end
  
    def lazy_load_track_contents
      contents.each do |lesson|
        Clients::Lessons::Lesson.new(
          response: lesson, track: @track
        ).save!
      end
    end
end