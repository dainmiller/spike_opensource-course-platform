require 'test_helper'

class SearchableTest < ActiveSupport::TestCase
  
  def setup
    Course.create! title: 'not-important'
    @result_matches             = search_by term: 'not-important'
    @result_not_matches         = search_by term: 'something-else'
    @result_classes_from_match  = @result_matches.map { |record| record.class.table_name }.uniq
    @result_classes_no_match    = @result_not_matches.map { |record| record.class.table_name }.uniq
  end
  
  def search_by term:
    Search.for term
  end
  
  def test_find_all_by_count
    assert_equal(1, @result_matches.count)
  end
  
  def test_find_none_by_count
    assert_equal(0, @result_not_matches.count)
  end

  def test_find_all_matches_classes
    assert_equal(['courses'], @result_classes_from_match)
  end
  
  def test_find_none_matches_classes
    assert_equal([], @result_classes_no_match)
  end
  
  def test_find_catchall_matches_classes
    results = search_by term: 'n'
    results_classes = results.map { |record| record.class.table_name }.uniq
    assert_equal(['courses'], results_classes)
  end

end
