module Clients

  # Github Client that serves as an access point
  # & client API for Github.
  #
  # Instantiating this class fetches all the repos
  # from the associated 'opensourcecourse' github org.
  #
  # ==== Examples
  #
  # Fetching the repos from Github can be called via
  #
  #   Clients::Github.all
  #   Clients::Github.build
  #
  # or for fallback purposes...
  #
  #   Clients::Github.new
  class Github
    include Clientable

    class << self
      # Proxy class methods that allows a simpler interface
      # to the &.each API.
      #
      # ==== Examples
      #
      #   Clients::Github.all.each do |repo|
      #     puts repo # => <Clients::RepoClass @response=data>
      #   end
      #
      # or
      #
      #   Clients::Github.build.each do |repo|
      #     puts repo # => <Clients::RepoClass @response=data>
      #   end
      def all ; new ; end
      def build ; new ; end
    end

    def initialize
      @repos = repos
    end
    
    def repos_url
      Clients::Config::Urls::REPOS
    end
    
    def repos
      @_repos ||= fetch_and_parse_and_cache(repos_url).map do |repo|
        Clients::Repo.new repo
      end
    end

    def each
      repos.each { |repo| yield repo }
    end

  end
end
