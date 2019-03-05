class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :url
      t.boolean :status
      t.integer :movie_id
      t.string :name

      t.timestamps
    end
  end
end
