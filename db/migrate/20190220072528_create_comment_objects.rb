class CreateCommentObjects < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_objects do |t|
      t.integer :comment_id
      t.integer :used_id
      t.integer :commentable_tyle
      t.string :comment

      t.timestamps
    end
    add_index :comment_objects, [:comment, :commentable_tyle]
  end
end
