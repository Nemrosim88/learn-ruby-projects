# lib/json_web_token.rb

class JsonWebToken
 class << self

    # "encode" method takes three params
    # 1. UserId
    # 2. expiration time
    # 3. unique base key of your Rails application -- to create a unique token
   def encode_access_token(payload, exp = 1.minute.from_now)
     payload[:exp] = exp.to_i
     JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS512')
   end

   def encode_refresh_token(payload, exp = 10.minutes.from_now)
     payload[:exp] = exp.to_i
     JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS512')
   end

   def verify(payload)
     JWT.decode(payload, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS512' })
   end

   def decode(token)
     body = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS512' })[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end

   def decode_v2(token)
    puts "DECODE V2"
    puts "DECODE.TOKEN = #{token}"
    puts "SECRET = #{Rails.application.secrets.secret_key_base}"
    secret = Rails.application.secrets.secret_key_base
    puts "SECRET 2 = #{secret}"

     body = JWT.decode(token, Rails.application.secrets.secret_key_base)
     puts "BODY #{body}"
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end