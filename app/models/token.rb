# https://github.com/jwt/ruby-jwt
class Token
  # set secret key here
  @hmac_secret = 'my$ecretK3y'
  # set token expired time here
  @sign_expired_time = 3600

  def self.encode(payload)
    time_stamp = Time.now.to_i
    payload[:signed_time] = time_stamp
    payload[:expired_time] = time_stamp + @sign_expired_time
    JWT.encode payload, @hmac_secret, 'HS256'
  end

  def self.decode(token)
    JWT.decode token, @hmac_secret, true, {algorithm: 'HS256'}
  end


end