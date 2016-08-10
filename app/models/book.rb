class Book < ApplicationRecord

	scope :finished, ->{ where.not(finished_on: nil) }
	# scope :recent, ->{ where('finished_on > ?', 2.days.ago)}
	def finished?
		finished_on.present?
	end

	def self.recent
		where('finished_on > ?', 2.days.ago)
		# where(finished_on > 2.days.ago)
		
	end
end
