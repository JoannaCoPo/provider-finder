class ProviderFacade
  class << self
    def all_queries(first_name, last_name, taxonomy_desc, state, limit = 200)
      response = NpiService.all_queries(first_name, last_name, taxonomy_desc, state, limit)
      create_provider_objects(response)
    end

    def create_provider_objects(response)
      response[:results].map { |data| Provider.new(data) }
    end
  end
end
