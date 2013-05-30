class Project < ActiveRecord::Base
  attr_accessible :book_size, :contribution_deadline, :event_date, :final_reminder, :invite_message_body, :invite_message_subject, :name, :name, :occasion, :reminder_1, :reminder_2, :sharing_preference
end
