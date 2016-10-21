require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'bcrypt'

class User
  include DataMapper::Resource
    has n, :links, :through => Resource

    property :id, Serial
    property :email, String
    property :password_digest, Text

    def password=(password)
      self.password_digest = BCrypt::Password.create(password)
    end

end
