# Formats the repository data from github into a class's attributes.
#
# ==== Options
#
# * <tt>:response</tt> - The JSON data directly from Github
#
# ==== Examples
#
#   Clients::Repo.new({}) # => <Clients::RepoClass @response>
#
class Clients::Repo < ApiClient
  include Clientable
  
  attr_accessor :response, :url, :title

  SETTINGS = {
    :table => Course
  }

  def initialize response
    @response = response
    super
  end

  private
    def _save
      @course ||= table.find_or_create_by title: title, url: url
      lazy_load_course_contents
    end
    
    def lazy_load_course_contents
      contents.each do |track|
        Clients::Track.new(
          response: track, course: @course
        ).save!
      end
    end
end
