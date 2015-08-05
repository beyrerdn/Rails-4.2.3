class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable

  def comment_counter
    total = 0
    self.each do |comment|
      while comment.commentable
        total += 1
      end
    end
    total
  end

end
