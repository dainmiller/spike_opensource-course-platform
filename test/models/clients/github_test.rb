require 'test_helper'

class Clients::GithubTest < ActiveSupport::TestCase
  
  test "github client exists" do
    assert Clients::Github.new
  end
  
  test "github org constant set" do
    assert_equal "opensourcecourses", Clients::Github::ORG
  end
  
  test "github client fetches repos from org" do
    assert_equal 1, Clients::Github.new.repos.count
  end
  
  test "github client contains route to generic /contents" do
    assert_not_nil Clients::Github::CONTENTS
  end
  
  test "github client builds repo classes for each repo in org" do
    assert_instance_of Repo, Clients::Github.new.repos.first
  end
  
end