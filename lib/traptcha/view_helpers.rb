require 'base64'

module Traptcha
  module ViewHelpers
    def captcha_image_tag
      captcha = Traptcha::Captcha.generate

      tag(:img, :src => "data:image/png;base64,#{Base64.encode64(captcha.to_png)}", :id => 'traptcha', :alt => 'captcha') + hidden_field_tag(:secure_hash, captcha.value)
    end

    def captcha_label_tag
      label_tag :captcha
    end

    def captcha_input_tag
      text_field_tag :captcha
    end

    def captcha_tag
      if block_given?
        yield captcha_image_tag, captcha_label_tag, captcha_input_tag
      else
        content_tag :ul do
          concat content_tag(:li, captcha_label_tag)
          concat content_tag(:li, captcha_image_tag)
          concat content_tag(:li, captcha_input_tag)
        end
      end
    end
  end
end
