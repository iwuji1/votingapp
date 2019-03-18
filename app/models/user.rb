class User < ApplicationRecord
  def self.from_omniauth(auth)
    binding.pry
    where(email: auth.info.email).first_or_initialize.tap do |user|
        user.update({
          'provider': auth.provider,
          'uid': auth.uid,
          'name': auth.info.name,
          'oauth_token': auth.credentials.token,
          'oauth_expires_at':Time.at(auth.credentials.expires_at)
          })
    # where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      # user.uid = auth.uid
      # user.name = auth.info.name
      # user.email = auth.info.email
      # user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      # user.save!
    end
  end

  has_many :votes
  has_many :ballots
  accepts_nested_attributes_for :votes
  accepts_nested_attributes_for :ballots
end
