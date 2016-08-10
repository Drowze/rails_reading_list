class Book < ApplicationRecord

	has_many :book_genres
	has_many :genres, through: :book_genres

	scope :finished, ->{ where.not(finished_on: nil) }
	scope :recent, ->{ where('finished_on > ?', 2.days.ago)}
	scope :search, ->(keyword){ where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
	# scope :filter, ->(genre_id){ joins(:book_genres).where(book_genres: {genre_id: genre_id})} # works but look hacky
	scope :filter, ->(name){ 
		joins(:genres).where('genres.name = ?', name) if name.present? 
		} # this so cool


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
