class Post < ActiveRecord::Base
	#associations
	has_many :comments , class_name: "Post", foreign_key: "parent"
	belongs_to :user
	has_many :status, foreign_key: "comment_id"
	has_many :user, through: :status
	has_and_belongs_to_many :doortag, :join_table => "doortags_posts"
	#validations
	validates :message, :presence => true
	validates :message, :length => { :maximum => 140 }
end
