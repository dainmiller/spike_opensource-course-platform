class CourseRecommendationMailerJob < ApplicationJob

  def perform user_id, course_id
    @user_id = user_id
    @course_id = course_id

    send_course_recommendation_mailer
  end

  def self.later user_id, course_id
    self.perform_later
  end

  private

    attr_reader :user_id, :video_id

    def send_course_recommendation_mailer
      # CourseRecommendationDripMailer.
      #   weekly_update(user: user, video: video).
      #   deliver_now
    end

    def user
      User.find user_id
    end

    def course
      Course.find video_id
    end

end
