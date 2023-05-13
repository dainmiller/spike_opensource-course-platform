module Clients
  module Config
    module Urls
      extend ActiveSupport::Concern

      ROOT      = 'https://api.github.com'.freeze
      ORG       = 'opensourcecourses'.freeze
      REPOS     = "#{ROOT}/orgs/#{ORG}/repos".freeze
      CONTENTS  = '/contents'.freeze
    end
  end
end
