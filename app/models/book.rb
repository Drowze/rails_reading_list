class Book < ApplicationRecord
	def finished?
		finished_on.present?
	end
end
