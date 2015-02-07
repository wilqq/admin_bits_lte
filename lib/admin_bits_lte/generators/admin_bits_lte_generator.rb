require 'rails/generators'
require 'rbconfig'

class AdminBitsLteGenerator < Rails::Generators::Base
  include AdminBits::GeneratorHelpers

  argument :resource,
    :type => :string,
    :required => true,
    :desc => "Name of the resource eg. 'products' will create 'namespace/products_controller.rb'"

  class_option :namespace,
    :type => :string,
    :desc => "Name of the namespace for the generated controller eg. 'admin'",
    :aliases => '-NS', :default => 'admin'

  self.source_paths << File.join(File.dirname(__FILE__), 'templates')

  # def create_layout
  #   template 'layout.html.erb', 'app/views/layouts/admin_bits/layout.html.erb'
  #   template 'stylesheets.css.scss', 'app/assets/stylesheets/admin_bits.css.scss'
  #   template 'javascripts.js', 'app/assets/javascripts/admin_bits.js'
  # end

  def create_index
    template 'index.html.erb', "app/views/#{namespace}/#{resource}/index.html.erb"
    template 'filters.html.erb', "app/views/#{namespace}/#{resource}/_filters.html.erb"
  end

  # def add_assets_initializer
  #   if (['admin_bits.css', 'admin_bits.js'] -  Rails.application.config.assets.precompile).any?
  #     content = 'Rails.application.config.assets.precompile += %w(admin_bits.css admin_bits.js)'
  #     path = 'config/initializers/assets.rb'

  #     File.write(path, content, mode: 'a')
  #   end
  # end
end
