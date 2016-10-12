class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :user_name
      t.string :oauth_token

      t.timestamps
    end
  end
end
