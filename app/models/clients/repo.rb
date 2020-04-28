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

  def self.all
    Clients::Github.all
  end

  def save_record
    save_record! callback_with: Clients::DataLoader::CourseLoader
  end
end
