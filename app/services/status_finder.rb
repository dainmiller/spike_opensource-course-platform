class StatusFinder
  
  def initialize user:
    @user = user
  end
  
  def current_status_for completeable
    Status.for completable
  end
  
end