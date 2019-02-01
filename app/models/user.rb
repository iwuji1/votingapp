class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_many :votes
  accepts_nested_attributes_for :votes
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
