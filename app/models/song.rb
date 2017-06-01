class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist
  has_many :users
  has_many :playlists

  validates :title, presence: true, length: { minimum: 2}
  validates :artist, presence: true, length: { minimum: 2}
end
