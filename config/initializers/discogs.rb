require 'discogs_config'

DiscogsConfig.config = YAML.load_file('config/discogs.yml')[Rails.env].symbolize_keys
