class Subreddit < ActiveRecord::Base
  has_many :posts
end
