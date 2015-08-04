class SubredditsController < ApplicationController

  def index
    @posts = Subreddit.where("title =?", params[:title]).first.posts.order(rating_cache: :desc)
  end

end
