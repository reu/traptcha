require 'traptcha/engine'

unless defined? Magick
  begin
    require 'rmagick'
  rescue LoadError
    require 'RMagick'
  end
end

module Traptcha
  autoload :Image,             'traptcha/image'
  autoload :WaveImage,         'traptcha/wave_image'
  autoload :Encryptors,        'traptcha/encryptors'
  autoload :Captcha,           'traptcha/captcha'
  autoload :ControllerHelpers, 'traptcha/controller_helpers'
  autoload :ViewHelpers,       'traptcha/view_helpers'
  autoload :InvalidCaptcha,    'traptcha/invalid_captcha'

  mattr_accessor :default_length
  @@default_length = 3

  mattr_accessor :default_width
  @@default_width = 200

  mattr_accessor :default_height
  @@default_height = 100

  mattr_accessor :valid_chars
  @@valid_chars = ('a'..'z').to_a + (0..9).map(&:to_s).to_a

  mattr_accessor :ignored_chars
  @@ignored_chars = %w(y k u v m n l i o 0 1 9 q e)

  mattr_accessor :default_image_generator
  @@default_image_generator = WaveImage

  mattr_accessor :default_encryptor
  @@default_encryptor = Encryptors::MD5

  mattr_accessor :default_wave_variation
  @@default_wave_variation = (20..90)

  mattr_accessor :default_wave_amplitude
  @@default_wave_amplitude = 5

  def self.setup
    yield self
  end
end
