module Searchable
  extend ActiveSupport::Concern
  
  included do
    scope :related_tables, -> {
      pluck(:bucketable_type)
    }
    
    # ==== Example
    #
    #   Bucket.find_all_by params[:s]
    #     # => [<Course=[]>, <Vault=[]>, etc]
    #
    # Also there is a proxy class you can use for a 
    # cleaner API...
    # 
    #   Search.for params[:s]
    #     # => [<Course=[]>, <Vault=[]>, etc]
    def self.find_all_by search_term
      related_tables.map do |table|
        self._find_all_by table: table, term: search_term
      end.compact.flatten
    end
    
    def self._find_all_by table:, term:
      begin
        table
          .titleize
          .constantize
          .where("title like '%#{term}%'")
      rescue
        []
      end
    end
  end
  
end