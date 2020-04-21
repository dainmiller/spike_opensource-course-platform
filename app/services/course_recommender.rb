class CourseRecommender
  
  def initialize user:, recommendable_courses:
    @user = user
    @recommendable_courses = recommendable_courses
  end
  
  def recommend
    suggestor.each do |course|
      create_recommendation course
      enqueue_email_for course
    end
  end
  
  private
  
    attr_reader :user, :recommendable_courses
  
    def suggestor
      ContentSuggestor.new \
        user: user,
        recommendables: recommendable_courses,
        recommended: previously_recommended
    end
    
    def create_recommendation course
      ContentRecommendation.create \
        user: user,
        recommendable: course
    end
    
    def enqueue_email_for course
      CourseRecommendationMailerJob.perform_later \
        user.id,
        course.id
    end

    def previously_recommended
      ContentRecommendation \
        .where(user: user)
        .map &:recommendable
    end
    
    def log_no_further_recs user
      Rails.logger.warn \
        "No further recommendable videos for user: #{user.id} <#{user.email}>"
    end

end