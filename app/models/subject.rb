class Subject < ActiveRecord::Base
	has_many :grades
	belongs_to :user
end
