class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :up_arrow, :down_arrow]
  before_action :authenticate_user!, only: [:new, :create, :update, :up_arrow, :down_arrow]
  before_filter :link_exist?, only: [:create]
  before_action :subreddit_select, only: [:new, :edit, :update, :create]
  # GET /posts
  # GET /posts.json

  def index
    @posts = Post.order(rating_cache: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.up_vote
    redirect_to @post.url
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def up_arrow
    @post.up_vote(current_user.id)
    redirect_to root_path
  end

  def down_arrow
    @post.down_vote(current_user.id)
    redirect_to root_path
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def subreddit_select
      @subreddit_options = Subreddit.all.collect{|subreddit| [subreddit.title, subreddit.id]}
    end

    #Check if url exists, if it does upvote the post with that url and redirect to home
    def link_exist?
      condition_result = Post.where("url =?", params[:post][:url]).empty?
      post = Post.where("url =?", params[:post][:url]).first
      if !condition_result
        redirect_to upvote_path(:id => post.id),
        notice: "Url '#{params[:post][:url]}' already exists under '#{post.title}'. You have registered an upvote on the original post. Try sharing something new!"
      end
      return condition_result
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :url, :summary, :subreddit_id)
    end
end
