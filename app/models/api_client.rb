# Basic Error objects
# 
# ==== Example
# 
#   Clients::Error::SaveRecordNotDefinedError.error
#     # => Clients::Error::SaveRecordNotDefinedError (msg here)
#
module Clients
  module Error
    class SaveRecordNotDefinedError < StandardError
      def self.halt_with_error
        raise self, new.message
      end
      
      def message
        "Please define `save_record` as an instance method on the child class [APIClient expects this]. This allows the API Client to get specific data from each child class, and the child class to delegate to ApiClient for generic work."
      end
    end
  end
end

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
# ==== Example
#
#   class Clients::Repo < ApiClient
#
#     def initialize response
#       @response = response
#       super
#     end
#
#   end
#
#   Client::Repo.new(response).title
#     # => ApiClient.new(response).title
#
class ApiClient
  include Clientable
  
  CONTENTS_PATH = Clients::Config::Urls::CONTENTS

  attr_reader :title, :url, :contents

  def initialize response
    @response = response
    @response = @response.fetch(:response) if key_exists?
    @url      = @response.fetch('url') + CONTENTS_PATH if url_exists?
    @title    = @response.fetch('name') if name_exists?
  end

  def contents
    @contents ||= fetch_and_parse url
  end

  def table
    self.class::SETTINGS[:table]
  end

  def save
    table.transaction { begin save! ; rescue ; end }
  end

  def save!
    begin child_configuration_set_up?
      save_record
    rescue NameError
      Clients::Error::SaveRecordNotDefinedError.halt_with_error
    end
  end

  private
    def save_record! belongs_to: nil, callback_with: nil
      Clients::DataSaver.new belongs_to, callback_with, self
    end

    def key_exists?
      @response.key? :response
    end

    def url_exists?
      @response.key? :url or 
        key_exists? and @response.fetch(:response).key? :url
    end
    
    def name_exists?
      @response.key? :name or 
        key_exists? and @response.fetch(:response).key? :name
    end

    def child_configuration_set_up?
      self.class.method_defined? :save_record
    end

end
