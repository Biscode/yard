class Announcement < ActiveRecord::Base

belongs_to :project

	has_one :project

end