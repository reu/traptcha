class Traptcha::CaptchasController < ApplicationController
  def show
    session[:captcha] = generated_captcha.value
    send_data generated_captcha.to_png
  end

  protected
  
  def generated_captcha
    @generated_captcha ||= Traptcha::Captcha.generate
  end
end
