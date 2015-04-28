class Task < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :project
	validates_presence_of :deadline

	belongs_to :team
	belongs_to :user

end
