# config/initializers/yaml_alias.rb
require 'yaml'
module YAML
  class << self
    alias_method :old_safe_load, :safe_load
    def safe_load(yaml, **kwargs)
      # aliases: true を強制的に追加して、Ruby 3.2の制限を突破するよ！
      old_safe_load(yaml, **kwargs.merge(aliases: true))
    end
  end
end