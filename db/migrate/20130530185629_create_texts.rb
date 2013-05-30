class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.integer :page_id
      t.integer :position
      t.text :message

      t.timestamps
    end
  end
end
