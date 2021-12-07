class NpiService
  class << self
    def get_provider_data(first_name, last_name, speciality, state, limit)
      response = connection.get(api_url(first_name, last_name, speciality, state, limit))
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def connection
      Faraday.new('https://npiregistry.cms.hhs.gov')
    end

    def api_url(first_name, last_name, speciality, state, limit)
      "/api/?version=2.0&first_name=#{first_name}&last_name=#{last_name}" +
      "&taxonomy_description=#{speciality}&state=#{state}&limit=#{limit}"
    end
  end
end
