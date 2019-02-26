class Ballot < ApplicationRecord
  #belongs_to :user
  has_many :votes
  accepts_nested_attributes_for :votes
end
