class CreateProducers < ActiveRecord::Migration[5.2]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :email
      t.integer :movie_id

      t.timestamps
    end
  end
end
