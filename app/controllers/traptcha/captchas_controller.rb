class Traptcha::CaptchasController < ApplicationController
  before_filter :set_cache_buster

  def show
    session[:captcha] = generated_captcha.value

    send_data generated_captcha.to_png, :disposition => 'inline', :type => 'image/png'
  end

  protected
  
  def set_cache_buster
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma']        = 'no-cache'
    response.headers['Expires']       = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

  def generated_captcha
    @generated_captcha ||= Traptcha::Captcha.generate
  end
end
