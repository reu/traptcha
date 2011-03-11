require "spec_helper"
require "rmagick"
require "fileutils"

describe Traptcha::Image do
  describe "save" do
    subject { Traptcha::Image.new("test") }
    let(:path) { File.expand_path(File.dirname(__FILE__) + "../../../tmp/image_spec") }

    before do
      FileUtils.mkdir_p path
    end

    it "saves a image file on an specific path" do
      expect { subject.save(path) }.to change { Dir["#{path}/*"].size }
    end

    after do
      FileUtils.rm_rf path
    end
  end
end
