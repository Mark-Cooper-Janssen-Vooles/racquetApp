module ActionView
  module Helpers
    module UrlHelper
      def method_tag(method)
        tag("input", type: "hidden", name: "_method", autocomplete: "off", value: method.to_s)
      end
    end
  end
end