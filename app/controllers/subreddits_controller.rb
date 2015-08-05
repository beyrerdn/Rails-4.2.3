class SubredditsController < ApplicationController

  def show
    @posts = Subreddit.where("title =?", params[:title]).first.posts.order(rating_cache: :desc)
  end

end
