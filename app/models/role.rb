class Role < ActiveRecord::Base
  attr_accessible :book_id, :role_type, :user_id

end
