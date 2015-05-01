class Task < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :project
	has_many :comments

	validates_presence_of :deadline

	belongs_to :user

	belongs_to :team
	belongs_to :user

	# validates_presence_of :deadline
end
