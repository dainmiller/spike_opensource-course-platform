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
    @url      = @response.fetch('url') + CONTENTS_PATH
    @title    = @response.fetch('name')
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
    save_record
  end

  private
    def save_record belongs_to: nil, callback:
      throw new Error \
        "Define method and pass data" unless self.class.method_defined? :save_record

      record ||= table.find_or_create_by title: title, url: url

      belongs_to.find(record.id).update \
        "#{belongs_to.class.table_name}_id" => belongs_to.id if belongs_to

      callback_with record
    end

    def key_exists?
      @response.key? :response
    end

end
