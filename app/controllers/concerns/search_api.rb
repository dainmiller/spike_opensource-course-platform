module SearchApi
  extend ActiveSupport::Concern
  
  # ==== Endpoint
  #
  #   /search?for=search%20term
  #   /search?s=search%20term
  #
  # ==== Search Result Format
  #
  #   Bucket.find_all_by search_term
  #     # => [<Course=[]>, <Vault=[]>, etc]
  #
  # or you can use the cleaner Search API
  # 
  #   Search.for search_term
  #     # => [<Course=[]>, <Vault=[]>, etc]
  def search
    @results = Search.for search_term
    respond_to do |format|
      format.json
    end
  end
  
  private
    def search_term
      terms = (params[:for] or params[:s])
      URI.encode terms unless terms.nil?
    end

end