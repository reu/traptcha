require "spec_helper"
require "rmagick"
require "fileutils"

describe Traptcha::WaveImage do
  it_behaves_like "a image generator"
end
