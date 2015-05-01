class Task < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :project
	belongs_to :team
	belongs_to :user

	# validates_presence_of :deadline
end
