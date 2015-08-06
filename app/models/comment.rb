class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :root, :polymorphic => true

  before_save :set_root

  def root_element
    commentable = self.commentable
    while commentable.is_a? Comment
      commentable = commentable.commentable
    end
    commentable
  end

  def set_root
    if commentable.is_a?(Comment) && commentable.root_id && commentable.root_type
      self.root_id = commentable.root_id
      self.root_type = commentable.root_type
    elsif commentable.is_a?(Comment) #only needed to set existing comments in DB
      self.root_id = root_element.id
      self.root_type = root_element.class.to_s
    else
      self.root_id = commentable.id
      self.root_type = commentable.class.to_s
    end

  end

end
