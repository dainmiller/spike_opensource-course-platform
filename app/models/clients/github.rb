module Clients  
  # 
  # Github Client that serves as an access point 
  # & client API for Github.
  #
  # Instantiating this class fetches all the repos
  # from the associated 'opensourcecourse' github org.
  # 
  # ==== Examples
  # 
  #   Clients::Github.new
  #
  class Github
    include Clientable
    
    ROOT      = "https://api.github.com"
    ORG       = "opensourcecourses"
    REPOS     = "#{ROOT}/orgs/#{ORG}/repos"
    CONTENTS  = "/contents"
  
    # Proxy method that allows a simpler interface
    # to the &.each API.
    #
    # ==== Examples
    #
    #   Clients::Github.all.each do |repo|
    #     puts repo # => <RepoClass @response=data>
    #   end
    def self.all
      new
    end
    
    def initialize
      @repos = repos
    end
    
    def repos
      cache_and_fetch_and_parse(REPOS).map { |repo| Repo.new(repo) }
    end
    
    def each
      repos.each do |repo|
        yield repo
      end
    end
    
  end
end