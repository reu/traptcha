require "spec_helper"

describe Traptcha::Captcha do
  describe ".generate" do
    context "when no options are informed" do
      subject { described_class.generate }

      it "generates a new captcha with the default valid chars" do
        subject.text.chars.all? { |char| Traptcha.valid_chars.include? char }.should be_true
      end

      it "generates a new captcha with the default length" do
        subject.text.size.should == 3
      end
    end

    context "informing the valid chars" do
      subject { described_class.generate :valid_chars => %w(a) }

      it "generates a new captcha with the informed chars" do
        subject.text.chars.all? { |char| char == "a" }.should be_true
      end
    end

    context "informing the length of 2 chars" do
      subject { described_class.generate :length => 2 }

      it "generates a new captcha with 2 chars" do
        subject.text.size.should == 2
      end
    end
  end
end
