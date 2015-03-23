class Task < ActiveRecord::Base
	belongs_to :project

#default_scope { where(status: 'in progress') }



end
