module Traptcha
  class Captcha
    attr_accessor :text, :image_generator, :encryptor

    def initialize(text = "")
      @text            = text
      @image_generator = Traptcha.default_image_generator
      @encryptor       = Traptcha.default_encryptor
    end

    def value
      @value ||= @encryptor.digest(text)
    end

    def to_png
      @image_generator.new(text).output.to_blob
    end

    class << self
      def generate
        new generate_random_captcha
      end

      def generate_random_captcha
        3.times.map { valid_chars[rand(valid_chars.length)] }.to_s
      end

      def valid_chars
        Traptcha.valid_chars - Traptcha.ignored_chars
      end
    end
  end
end
