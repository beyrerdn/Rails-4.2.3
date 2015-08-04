class Post < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  belongs_to :subreddit

  #Adds an upvote to active post
  def up_vote(current_user_id)
    upvote = Vote.create(:up => true, :user_id => current_user_id)
    votes << upvote
  end

  #Adds a downvote to active post
  def down_vote(current_user_id)
    downvote = Vote.create(:up => false, :user_id => current_user_id)
    votes << downvote
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

end
