class String
  def ^(other)
    if other.empty?
      self
    else
      str1 = self.unpack("c*")
      str2 = other.unpack("c*")
      str2 *= str1.length/str2.length + 1
      str1.zip(str2).collect{|c1,c2| c1^c2}.pack("c*")
    end
  end
end

module Devise
  module Encryptable
    module Encryptors
      class Md5 < Base
        def self.encrypt(password)
          key = 'KEY'
          password ^ key
        end
        def self.digest(password, stretches, salt, pepper)
          self.encrypt(password)
        end
      end
    end
  end
end