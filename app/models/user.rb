class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true
  validates :email, presence: true
  has_many :votes
  accepts_nested_attributes_for :votes
end
