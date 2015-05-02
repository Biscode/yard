class Announcement < ActiveRecord::Base
<<<<<<< HEAD
	has_one :project
=======

belongs_to :project

	has_one :project

>>>>>>> 2a4e3ffb73c1609b70fcfec2318d759011c7b955
end
