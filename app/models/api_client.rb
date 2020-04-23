# Inheritance API used on all Client::*.rb
# 
# This allows for exposing of data that is usedacross all sub-classes.
#
# Formats the repository data from github into a class's attributes.
#
# ==== Options
#
# * <tt>:response</tt> - The JSON data directly from Github
#
# ==== Implementation Example
# 
#   class Clients::Repo < ApiClient
#     def initialize response
#       @response = response
#       super
#     end
#   end
# 
# Keep in mind the `super` call on init is required,
# because this checks that the @response variable is set.
#
class ApiClient
  include Clientable
  
  attr_reader :title, :url, :contents
  
  def initialize response
    @response = response
    
    begin
      @url = @response.fetch('url') + Clients::Github::CONTENTS
      @title = @response.fetch('name')
    rescue
      @url = @response.fetch(:response).fetch('url')
      @title = @response.fetch(:response).fetch('name')
    end
  end

  def contents
    @contents ||= fetch_and_parse url
  end
  
  def table
    self.class::SETTINGS[:table]
  end
  
  def save
    table.transaction { begin _save ; rescue ; end }
  end

  def save!
    _save
  end
  
end
