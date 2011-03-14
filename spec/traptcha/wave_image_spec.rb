require "spec_helper"
require "rmagick"
require "fileutils"

describe Traptcha::WaveImage do
  it_behaves_like "a image generator"

  describe "#amplitude" do
    let(:amplitude) { 4 }

    it "can be informed as a option on the initialization process" do
      Traptcha::WaveImage.new("test", :amplitude => amplitude).amplitude.should == amplitude
    end
  end

  describe "#wave_variation" do
    let(:variation) { 10..20 }

    it "can be informed as a option on the initialization process" do
      Traptcha::WaveImage.new("test", :variation => variation).variation.should == variation
    end
  end
end
