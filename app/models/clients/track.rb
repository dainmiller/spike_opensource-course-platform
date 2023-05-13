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
    def save_record
      save_record! \
        belongs_to: @course,
        callback_with: Clients::DataLoader::TrackLoader
    end
end
