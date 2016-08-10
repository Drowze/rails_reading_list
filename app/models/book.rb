class Book < ApplicationRecord

	scope :finished, ->{ where.not(finished_on: nil) }
	scope :recent, ->{ where('finished_on > ?', 2.days.ago)}
	# scope :search, ->(keyword){ where(title:keyword) if keyword.present? }

	def self.search(keyword)
		keyword.present? ? where(title: keyword) : all
	end

	def finished?
		finished_on.present?
	end

	# def self.recent # THAT WORKS WHOA
	# 	# where('finished_on > ?', 2.days.ago) 

	# end
end
