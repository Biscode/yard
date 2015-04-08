class Task < ActiveRecord::Base
	belongs_to :sprint
	validates_presence_of :deadline
	belongs_to :project
end
