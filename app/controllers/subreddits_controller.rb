class SubredditsController < ApplicationController

  def index
    @posts = Subreddit.where("title =?", params[:title]).first.posts.sort_by{|post| post.rating}.reverse!
  end

end
