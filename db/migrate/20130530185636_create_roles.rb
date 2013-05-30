class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :role_type

      t.timestamps
    end
  end
end
