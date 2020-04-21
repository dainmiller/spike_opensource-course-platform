class ContentSuggestor
  NEXT_UP_IN_UNRECOMMENDED_LIST = 1
  
  def initialize recommendables:, user:, recommended:
    @recommendables = recommendables
    @status_finder  = StatusFinder.new user: user
    @recommended    = recommended
  end
  
  def next_up
    unrecommended.take NEXT_UP_IN_UNRECOMMENDED_LIST
  end
  
  def each
    unrecommended.each { |recommendable| 
      yield recommendable
    }
  end
  
  private
  
    attr_reader :recommendables, :recommended, :status_finder
    
    def unrecommended
      recommendables - recommended
    end
    
    # def first_unseen_recommendable
    #   unrecommended_recommendables.detect do |recommendable|
    #     status_finder
    #       .current_status_for(recommendable)
    #       .unstarted?
    #   end
    # end

end