# Formats the repository data from github into a class's attributes.
#
# ==== Options
#
# * <tt>:response</tt> - The JSON data directly from Github
# 
# ==== Examples
#
#   Repo.new({}) # => <RepoClass @response>
#
class Repo
  include Clientable
  
  attr_reader :response, :url, :title
  
  def initialize response
    @response = response
  end
  
  def url
    @url ||= @response.fetch('url') + Clients::Github::CONTENTS
  end
  
  def title
    @title ||= @response.fetch('name')
  end
  
  # Fetches contents of the repository from Github
  # 
  # 
  def contents
    @contents ||= fetch_and_parse url
  end
  
end