class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :content
      t.integer :total_episodes
      t.boolean :status
      t.integer :user_id

      t.timestamps
    end
  end
end
