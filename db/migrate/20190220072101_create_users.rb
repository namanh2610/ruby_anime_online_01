class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :account
      t.string :password_digest
      t.string :user_role_id, default: 3

      t.timestamps
    end
  end
end
