class Option < ApplicationRecord
  belongs_to :candidates
  belongs_to :users
  attr_accessible :votes, :candidate_id
end
