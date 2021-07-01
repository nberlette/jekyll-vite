# frozen_string_literal: true

module Jekyll::Vite::Config
  # Override: Default values for a Rails application.
  def config_defaults(**opts)
    require 'jekyll'
    config = Jekyll.configuration
    super(**opts, mode: Jekyll.env).tap do |defaults|
      defaults['public_dir'] = config['cache_dir']
      defaults['build_cache_dir'] = File.join(config['cache_dir'], 'vite-build')
    end
  end
end

ViteRuby::Config.singleton_class.prepend(Jekyll::Vite::Config)
