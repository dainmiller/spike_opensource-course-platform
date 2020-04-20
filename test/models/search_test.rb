require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  
  def test_search_api_proxies_searchable_concern
    methods_on_search_class = Search.methods-Object.methods
    assert Search.for('t'), []
    assert_includes methods_on_search_class, :for
  end
  
end