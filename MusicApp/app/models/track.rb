class Track < ActiveRecord::Base
  validates :title, :album_id, :style, presence: true

  belongs_to :album

  has_one :band, through: :album, source: :band

  has_many :notes
end
