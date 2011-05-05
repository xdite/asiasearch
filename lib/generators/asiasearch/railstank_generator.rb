require 'rails/generators/base'

class AsiaSearchGenerator < Rails::Generators::Base
  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def copy_config_file
    copy_file "asiasearch.yml.example", "config/asiasearch.yml.example"
  end
end