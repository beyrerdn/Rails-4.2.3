class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :post_id, :scope => :user_id
  after_save :update_post_rating_cache

  #Look up delegates
  def update_post_rating_cache
    self.post.update_rating_cache
  end

end
