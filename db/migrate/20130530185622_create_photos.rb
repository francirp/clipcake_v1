class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :page_id
      t.integer :position
      t.string :source_url

      t.timestamps
    end
  end
end
