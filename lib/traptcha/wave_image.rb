module Traptcha
  class WaveImage < Image
    attr_accessor :variation, :amplitude

    def variation
      @variation ||= @options[:variation] ||= Traptcha.default_wave_variation
    end

    def amplitude
      @amplitude ||= @options[:amplitude] || Traptcha.default_wave_amplitude
    end

    protected

    def generate
      super
      wavenize
    end

    def wavenize
      @canvas = @canvas.wave(amplitude, random_variation)
    end

    private

    def random_variation
      rand(variation.last - variation.first) + variation.first
    end
  end
end
