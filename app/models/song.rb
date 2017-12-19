class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validate :released_year_valid
  validate :genre_valid

  private

  def genre_valid
    if genre
      if genre.class != String
        error.add(:genre, "Genre must be a string")
      end
    end
  end

  def released_year_valid
    if released
      if release_year.class == NilClass
        errors.add(:release_year, "Must have year")
      elsif release_year > Time.now.year
        errors.add(:release_year, "Year invalid")
      end
    end
  end





end
