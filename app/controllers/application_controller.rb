class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    User.find_by(id: session[:user_id])
  end

  # def course_time(course)
  #   if course.day?
  #     course_time == "Day"
  #   else
  #     course_time == "Night"
  #   end
  # end

  helper_method :current_user

end
