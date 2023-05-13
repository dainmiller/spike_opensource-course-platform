require 'test_helper'

class Clients::GithubTest < ActiveSupport::TestCase

  test "github client exists" do
    assert Clients::Github.new
  end

  test "github org constant set" do
    assert_equal "opensourcecourses", Clients::Config::Urls::ORG
  end

  test "github client fetches repos from org" do
    count = JSON.parse(
      HTTParty.get(
        'https://api.github.com/orgs/opensourcecourses/repos/'
      ).body
    ).count
    assert_equal count, Clients::Github.new.repos.count
  end

  test "github client includes route to generic '/contents' path" do
    assert_not_nil Clients::Config::Urls::CONTENTS
  end

  test "github client builds Repo classes for each repo in github org" do
    assert_instance_of Clients::Repo, Clients::Github.new.repos.first
  end

  test "github client exposes a #.all method that proxies #.new class method" do
    assert_respond_to   Clients::Github, :all
    assert_instance_of  Clients::Github, Clients::Github.all
    assert_instance_of  Clients::Github, Clients::Github.new
  end

  test "github client exposes a #.each instance method that iterates over repos" do
    assert Clients::Github.new.each { |e| nil } 
    assert_respond_to Clients::Github.all, :each
    assert_raise(LocalJumpError) { Clients::Github.new.each }

    Clients::Github.all.each do |repo|
      assert_instance_of  Clients::Repo, repo
      assert_respond_to   repo, :title
    end
  end


end
