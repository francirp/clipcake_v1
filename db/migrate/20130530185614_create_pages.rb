class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :layout
      t.integer :page_number

      t.timestamps
    end
  end
end
