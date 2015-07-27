class CreateDoortags < ActiveRecord::Migration
  def change
    create_table :doortags do |t|
      t.string :tag_name

      t.timestamps null: false
    end
  end
end
