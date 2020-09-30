class Song < ApplicationRecord
    
    validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]}
    validates :released, inclusion: {in: [true, false]}
    with_options if: :released? do |release|
        release.validates :release_year, presence: true
        release.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
    end
    validates :artist_name, presence: true


end
