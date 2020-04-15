require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  
  test "Repo class exists" do
    assert Repo.new(nil)
  end
  
  test "Repo class should start w/response json" do
    assert_raise(ArgumentError) { Repo.new }
  end
  
  test "Repo class contains URL to contents for that repo on github" do  
    client = Clients::Github.new
    assert_equal client.repos.first.url, "#{client.repos.first.response.fetch('url')}/contents"
  end

  test "Repo class contains title to contents for repo on github" do
    client = Clients::Github.new
    assert_equal client.repos.first.title, "abc-course"
  end
  
  test "Repo class fetches contents of repos in org via repo contents path" do
    repo = Clients::Github.new.repos.first
    assert_not_nil repo.contents
  end
  
end