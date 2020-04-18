module SearchableApi
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
  def search
    @results = Bucket.find_all_by search_term
  end
  
  private
    def search_term
      URI.encode params[:for] || params[:s]
    end

end