require 'active_support/concern'

module ApiResource
  extend ActiveSupport::Concern

  class_methods do
    def element_path(id, prefix_options = {}, query_options = {})
      super(id, prefix_options, query_options.merge({ api_key: Rails.application.secrets.riot_api_key }))
    end

    def collection_path(prefix_options = {}, query_options = {})
      super(prefix_options, query_options.merge({ api_key: Rails.application.secrets.riot_api_key }))
    end
  end
end
