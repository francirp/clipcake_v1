class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :occasion
      t.date :event_date
      t.date :reminder_1
      t.date :reminder_2
      t.date :final_reminder
      t.date :contribution_deadline
      t.string :book_size
      t.string :invite_message_subject
      t.text :invite_message_body
      t.string :sharing_preference
      t.string :name

      t.timestamps
    end
  end
end
