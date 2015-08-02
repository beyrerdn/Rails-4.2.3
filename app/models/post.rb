class Post < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  def up_vote
    upvote = Vote.create(:up => true)
    votes << upvote
  end

  def down_vote
    downvote = Vote.create(:up => false)
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
