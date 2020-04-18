module Searchable
  extend ActiveSupport::Concern
  
  included do
    scope :related_tables, -> {
      pluck(:bucketable_type).uniq
    }

    # ==== Example
    #
    #   Bucket.find_all_by params[:s]
    #     # => [<Course=[]>, <Vault=[]>, etc]
    #
    def self.find_all_by search_term
      related_tables.map do |table|
        _find_all_by table: table, term: search_term 
      end.compact.flatten
    end
  end
  
  def _find_all_by table:, term:
    begin
      table
        .titleize
        .constantize
        .where("title like %#{term}%")
    rescue
      []
    end
  end
  
end