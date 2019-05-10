class JsonWebToken
  JWT_KEY = ENV['JWT_KEY']

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_KEY)
  end

  def self.decode(token)
    JWT.decode(token, JWT_KEY)[0]
  rescue JWT::DecodeError, JWT::VerificationError, JWT::ExpiredSignature => e
    nil
  end
end
