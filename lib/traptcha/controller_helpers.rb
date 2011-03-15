module Traptcha
  module ControllerHelpers
    extend ActiveSupport::Concern

    included do
      helper_method :valid_captcha?
    end

    def valid_captcha?
      params[:captcha] && session[:captcha] && Traptcha::Captcha.new(params[:captcha]).value == session[:captcha]
    end
  
    def validate_captcha
      raise Traptcha::InvalidCaptcha unless valid_captcha?
    end
  end
end
