class CreateFacebooks < ActiveRecord::Migration
  def change
    create_table :facebooks do |t|
      t.integer :user_id
      t.string :uid
      t.string :provider
      t.string :access_token
      t.datetime :access_token_expires_at

      t.timestamps
    end
  end
end
