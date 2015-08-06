class Post < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  belongs_to :subreddit
  has_many :comments, :as => :commentable
  has_many :threaded_comments, :as => :root, :class_name => User

  def update_rating_cache
    self.rating_cache = self.rating
    self.save!
  end

  #Adds an upvote to active post
  def up_vote(current_user_id)
    votes << Vote.new(:up => true, :user_id => current_user_id)
  end

  #Adds a downvote to active post
  def down_vote(current_user_id)
    votes << Vote.new(:up => false, :user_id => current_user_id)
  end

  #Count upvotes
  def up_votes
    votes.where("up = ?", true).count
  end

  #Count downvotes
  def down_votes
    votes.where("up = ?", false).count
  end

  #Display post rating
  def rating
    up_votes - down_votes
  end

  def comment_counter(link, total = 0)
    if link.comments
      total += link.comments.count
      link.comments.each do |com|
        comment_counter(com, total)
      end
    end
    total
  end

end
