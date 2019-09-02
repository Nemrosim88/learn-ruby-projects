# lib/json_web_token.rb

class JsonWebToken
 class << self

    # "encode" method takes three params
    # 1. UserId
    # 2. expiration time
    # 3. unique base key of your Rails application -- to create a unique token
   def encode(payload, exp = 24.hours.from_now)
     payload[:exp] = exp.to_i
     JWT.encode(payload, Rails.application.secrets.secret_key_base)
   end

   def decode(token)
     body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end