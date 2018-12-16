class Place < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true,
                      length: { minimum: 2 }
    validates :latitude, presence: true
    validates :longitude, presence: true
end
