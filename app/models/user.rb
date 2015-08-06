class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :votes
  has_many :comments
  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :self_comments, :as => :commentable, :class_name => Comment
  has_many :threaded_comments, :as => :root, :class_name => User

end
