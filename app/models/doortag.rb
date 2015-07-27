class Doortag < ActiveRecord::Base
	has_and_belongs_to_many :post, :join_table => "doortags_posts"
end