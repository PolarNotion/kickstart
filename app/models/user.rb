class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :omniauthable,
         omniauth_providers: [:linkedin, :facebook, :twitter, :github]

  has_paper_trail

  has_one_attached :profile_photo

  has_many :oauth_providers

  scope :contains,         -> (q)        { where("first_name ilike ? OR last_name ilike ? OR email ilike ?", "%#{q}%", "%#{q}%", "%#{q}%")}
  scope :created_in_range, -> (min, max) { where(created_at: min..max) }
  scope :created_in_year,  -> (year)     { created_in_range(year.beginning_of_year, year.end_of_year)}
  scope :recent,           ->            { created_in_range(30.days.ago, 0.minutes.ago)}

  validates :first_name, presence: true
  validates :last_name,  presence: true

  before_save :_ensure_private_auth_token

  def is_deactivated?
    deactivated_at.present? and deactivated_at < 0.minutes.ago
  end

  def deactivate!
    update(deactivated_at: 0.minutes.ago)
  end

  def activate!
    update(deactivated_at: nil)
  end

  private

  def _ensure_private_auth_token
    self.private_auth_token = Devise.friendly_token[0,20] unless private_auth_token.present?
  end
end
