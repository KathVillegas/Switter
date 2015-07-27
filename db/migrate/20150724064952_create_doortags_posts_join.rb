class CreateDoortagsPostsJoin < ActiveRecord::Migration
  def change
    create_table :doortags_posts, :id => false do |t|
    	t.integer 'post_id'
    	t.integer 'tag_id'
    end
  	
  	add_index :doortags_posts, ['post_id', 'tag_id']
  end


end
