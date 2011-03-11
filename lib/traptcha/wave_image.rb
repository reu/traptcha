module Traptcha
  class WaveImage < Image
    def initialize(text, options = { :variation => (20..90), :amplitude => 4 })
      super(text)
      @variation = options[:variation]
      @amplitute = options[:amplitude]
    end

    protected

    def generate
      super
      wavenize
    end

    def wavenize
      @canvas = @canvas.wave(@amplitute, random_variation)
    end

    private

    def random_variation
      rand(@variation.last - @variation.first) + @variation.first
    end
  end
end
