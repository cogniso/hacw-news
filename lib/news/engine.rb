require 'awesome_nested_set'
require 'bootstrap-sass'

module News
  class Engine < ::Rails::Engine
    isolate_namespace News
  end
end
