# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require "logger" # ← これを追加！
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Portfolio
  class Application < Rails::Application
    # ここから下を追加！
  config.load_defaults 6.1
  
  # YAMLのエイリアス（&や*）を許可する設定
  config.active_support.use_yaml_unsafe_load = true
 # Rails 6.1 + Ruby 3.2 での警告を「安全に」消す方法
config.active_record.use_yaml_unsafe_load = true if Rails.gem_version >= Gem::Version.new('6.1.7')
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
  end
end
