class ClientUser < ApplicationRecord
  has_secure_password
  acts_as_paranoid
  belongs_to :client

  LOGIN_EXPIRED = 7.days

  enum role: {
    master: 1,
  }

  def create_token
    payload = { id: id, exp: (Time.zone.now + LOGIN_EXPIRED).to_i }
    encode_token(payload)
  end

  def self.decode_token(token)
    JWT.decode token, Rails.application.secret_key_base
  end

  private
  def encode_token(payload)
    JWT.encode payload, Rails.application.secret_key_base
  end
end
