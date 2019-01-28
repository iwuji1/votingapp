class Option < ApplicationRecord
  belongs_to :candidates
  belongs_to :users
end
