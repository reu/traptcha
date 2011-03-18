require "rails"

module Traptcha
  class Engine < Rails::Engine
    initializer "traptcha" do |app|
      ActiveSupport.on_load(:action_controller) do
        include Traptcha::ControllerHelpers
      end

      ActiveSupport.on_load(:action_view) do
        include Traptcha::ViewHelpers
      end
    end
  end
end
