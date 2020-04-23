require 'test_helper'

class VaultTest < ActiveSupport::TestCase

  test "has_many :courses association" do
    vault = Vault.create
    assert vault.respond_to? :courses
  end

end
