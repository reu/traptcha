module Traptcha
  class Image
    def initialize(text)
      @text = text
      @canvas = Magick::Image.new(150, 100)
      @canvas.format = "PNG"
    end

    def save(path)
      generate
      @canvas.write(File.join(path, @text + ".png"))
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
          self.pointsize = (20..50).to_a.choice
        end

        position += (20..25).to_a.choice
      end
    end
  end
end
