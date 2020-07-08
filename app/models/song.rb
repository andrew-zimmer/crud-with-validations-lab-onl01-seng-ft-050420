class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: {scope: :artist_name}
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: -> {:released == true}
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
      end


    def is_released_true
        self.released == true
    end
end
