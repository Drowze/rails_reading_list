class Book < ApplicationRecord

	scope :finished, ->{ where.not(finished_on: nil) }
	scope :recent, ->{ where('finished_on > ?', 2.days.ago)}
	scope :search, ->(keyword){ where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }

	before_save :set_keywords

	# def self.search(keyword) # THIS WORKS BEAUTIFULY
	# 	keyword.present? ? where(title: keyword) : all
	# end

	def finished?
		finished_on.present?
	end

	protected
		def set_keywords
			self.keywords = [title, author, description].map(&:downcase).join(' ')
		end

	# def self.recent # THAT WORKS WHOA
	# 	# where('finished_on > ?', 2.days.ago) 

	# end
end
