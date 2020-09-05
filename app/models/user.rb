class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_paper_trail

  has_one_attached :profile_photo

  scope :contains,         -> (q)        { where("first_name ilike ? OR last_name ilike ? OR email ilike ?", "%#{q}%", "%#{q}%", "%#{q}%")}
  scope :created_in_range, -> (min, max) { where(created_at: min..max) }
  scope :created_in_year,  -> (year)     { created_in_range(year.beginning_of_year, year.end_of_year)}
  scope :recent,           ->            { created_in_range(30.days.ago, 0.minutes.ago)}

  validates :first_name, presence: true
  validates :last_name,  presence: true
end
