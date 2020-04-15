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
  
  def contents
    @contents ||= fetch_and_parse url
  end
  
end