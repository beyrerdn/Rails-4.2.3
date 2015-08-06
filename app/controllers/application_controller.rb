class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :bio, :username, :password, profile_attributes: [:user_id])}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :bio, :username, :password, profile_attributes: [:user_id])}
  end

end

def subreddit_links
  @subreddit_links = Subreddit.first(10)
end

def format_not_html
  !request.format.html?
end

private

protect_from_forgery with: :null_session
protect_from_forgery with: :exception
before_action :authenticate_user!
before_filter :subreddit_links, unless: :format_not_html
