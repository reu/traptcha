module Traptcha
  autoload :Image,     'traptcha/image'
  autoload :WaveImage, 'traptcha/wave_image'

  class << self

    def default_wave_variation
      @@default_wave_variation ||= (20..90)
    end
  
    def default_wave_variation=(variation)
      @@default_wave_variation = variation
    end
  
    def default_wave_amplitude
      @@default_wave_amplitude ||= 5
    end
  
    def default_wave_amplitude=(amplitude)
      @@default_wave_amplitude = amplitude
    end
  end

  def self.setup
    yield self
  end
end
