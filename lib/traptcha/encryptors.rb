require 'digest/md5'

module Traptcha
  module Encryptors
    class MD5
      def self.digest(text)
        Digest::MD5.hexdigest(text)
      end
    end
  end
end
