class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :comment_id
      t.integer :user_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
