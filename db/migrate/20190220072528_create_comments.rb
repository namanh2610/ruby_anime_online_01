class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :image
      t.integer :like_count, default: 0
      t.integer :movie_id
      t.integer :user_id

      t.timestamps
    end
  end
end
