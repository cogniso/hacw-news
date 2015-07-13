require 'awesome_nested_set'
require 'bootstrap-sass'
require 'friendly_id'
require 'jquery-rails'

module News
  class Engine < ::Rails::Engine
    isolate_namespace News
  end
end
