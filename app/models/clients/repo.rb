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
class Clients::Repo
  include Clientable
  attr_accessor :response, :url, :title

  SETTINGS = {
    :table => Course
  }
  
  def initialize response
    @response = response
  end
  
  def url
    @url ||= @response.fetch('url') + Clients::Github::CONTENTS
    @url
  end
  
  def title
    @title ||= @response.fetch('name')
    @title
  end
  
  def contents
    @contents ||= fetch_and_parse url
    @contents
  end
  
  def course
    SETTINGS[:table]
  end
  
  def save
    Course.transaction do
      _save
    end
  end
  
  def save!
    _save
  end
  
  private
    def _save
      course.find_or_create_by title: title, url: url
    end
    
end