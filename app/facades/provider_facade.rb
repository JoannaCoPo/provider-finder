class ProviderFacade
  class << self
    def provider_data(first_name, last_name, specialty, state, limit = 200)
      response = NpiService.get_provider_data(first_name, last_name, specialty, state, limit)
      create_provider_objects(response)
    end

    def create_provider_objects(response)
      response[:results].map { |data| Provider.new(data) }
    end
  end
end
