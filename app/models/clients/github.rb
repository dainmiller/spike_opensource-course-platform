module Clients  
  class Github
    include Clientable
    
    ROOT      = "https://api.github.com"
    ORG       = "opensourcecourses"
    REPOS     = "#{ROOT}/orgs/#{ORG}/repos"
    CONTENTS  = "/contents"
    
    def initialize
      @repos = repos
    end
    
    def repos
      cache_and_fetch_and_parse(REPOS).map { |repo| Repo.new(repo) }
    end
    
  end
end