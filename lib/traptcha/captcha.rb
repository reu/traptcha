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
      def generate(options = {})
        options.reverse_merge! :valid_chars => Traptcha.valid_chars - Traptcha.ignored_chars,
                               :length => Traptcha.default_length

        new generate_random_captcha(options)
      end

      def generate_random_captcha(options = {})
        options[:length].times.map { options[:valid_chars][rand(options[:valid_chars].length)] }.to_s
      end
    end
  end
end
