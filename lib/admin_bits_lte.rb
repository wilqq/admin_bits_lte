require "admin_bits_lte/version"
require "admin_bits_lte/generators/admin_bits_lte_generator"

module AdminBitsLte
  def self.call_generator(params)
    Rails::Generators.invoke('admin_bits_lte', [params['resource'], "--namespace=#{params['namespace']}"])
  end
end
