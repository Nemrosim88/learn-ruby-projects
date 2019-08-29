# frozen_string_literal: true

require 'bcrypt'

my_password = BCrypt::Password.create('my password')
puts my_password

my_password = BCrypt::Password.new('$2a$12$vF99ZOt0AV.pyxPfxG76bebHEsG0WehiUc.BDYAH0VG0hoaW74l.S')
puts my_password == 'my password'