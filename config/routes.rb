Rails.application.routes.draw do
  resource :captcha, :only => :show, :module => :traptcha
end
