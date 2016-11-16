require 'rails/generators/base'

module ScriptRunner
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Creates a ScriptRunner initializer and copy locale files to your application."

      def copy_initializer
        template "script_runner.rb", "config/initializers/script_runner.rb"
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/script_runner.en.yml"
      end

      def copy_route
        route 'mount ScriptRunner::Engine => "/script_runner"'
      end
    end
  end
end
