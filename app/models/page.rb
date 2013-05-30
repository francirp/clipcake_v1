class Page < ActiveRecord::Base
  attr_accessible :layout, :page_number, :project_id, :user_id
end
