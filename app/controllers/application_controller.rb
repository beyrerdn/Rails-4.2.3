class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :subreddit_links, unless: :format_not_html

  def subreddit_links
    @subreddit_links = Subreddit.first(10)
  end

  def format_not_html
    !request.format.html?
  end

end
