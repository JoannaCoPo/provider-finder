class NpiService
  class << self
    def all_queries(first_name, last_name, taxonomy_desc, state, limit)
      response = connection.get("/api/?version=2.0&first_name=#{first_name}&last_name=#{last_name}&taxonomy_description=#{taxonomy_desc}&state=#{state}&limit=#{limit}")
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def connection
      Faraday.new('https://npiregistry.cms.hhs.gov')
    end
  end
end
