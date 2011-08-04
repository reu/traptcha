module Traptcha
  class Image
    delegate :to_png, :to => :output

    def initialize(text, options = {})
      @text = text
      @canvas = ::Magick::Image.new(Traptcha.default_width, Traptcha.default_height)
      @canvas.format = "PNG"
      @options = options
    end

    def save(path)
      output.write(File.join(path, @text + ".png"))
    end

    def output
      generate
      @canvas
    end

    protected

    def generate
      write_letters
    end

    def write_letters
      image = ::Magick::Draw.new

      image.font_family = "Thonburi"
      image.font_weight = ::Magick::BoldWeight

      position = 0

      @text.chars.each do |letter|
        image.annotate(@canvas, 0, 0, position, 90, letter) do
          self.fill = "black"
          self.pointsize = (40..80).to_a.choice
        end

        position += (40..55).to_a.choice
      end
    end
  end
end
