require 'rails/generators'
require 'rbconfig'

class AdminBitsLteGenerator < Rails::Generators::Base
  argument :resource,
    :type => :string,
    :required => true,
    :desc => "Name of the resource eg. 'products' will create 'namespace/products_controller.rb'"

  class_option :namespace,
    :type => :string,
    :desc => "Name of the namespace for the generated controller eg. 'admin'",
    :aliases => '-NS', :default => 'admin'

  self.source_paths << File.join(File.dirname(__FILE__), 'templates')

  def create_layout
    template 'layout.html.erb', 'app/views/layouts/admin_bits/layout.html.erb'
    template 'stylesheets.css.scss', 'app/assets/stylesheets/admin_bits.css.scss'
    template 'javascripts.js', 'app/assets/javascripts/admin_bits.js'
  end

  def create_index
    template 'index.html.erb', "app/views/#{namespace}/#{resource}/index.html.erb"
    template 'filters.html.erb', "app/views/#{namespace}/#{resource}/_filters.html.erb"
  end

  protected

  def namespace
    options[:namespace]
  end

  def resource_name
    (resource.singularize + '_resource')
  end

  def attribute_names
    raw_resource = eval(resource.singularize.camelcase)
    if raw_resource.class == Class
      names = raw_resource.attribute_names
      names.delete_if do |attribute|
        attribute[-3..-1] == '_id'
      end
    else
      []
    end
  end
end
