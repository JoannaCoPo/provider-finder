class NpiService
  class << self
    def last_name_state(last_name, state_abbreviation)
      response = connection.get("/api/?version=2.0&last_name=#{last_name}&state=#{state_abbreviation}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def first_last_names(first_name, last_name)
      response = connection.get("/api/?version=2.0&first_name=#{first_name}&last_name=#{last_name}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def taxonomy_state(taxonomy_description, state_abbreviation)
      response = connection.get("/api/?version=2.0&taxonomy_description=#{taxonomy_description}&state=#{state_abbreviation}")
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def connection
      Faraday.new('https://npiregistry.cms.hhs.gov')
    end
  end
end

# defaults to 10 results, but also seems the max is 200?

# The backend API calls serving the UI need to accept searches by:
# ○ Lastname + 2 character state
# ○ Firstname + Lastname
# ○ Exact specialty + 2 character state

#follow up and method naming conventions
# note in readme decision to use verbose naming conventions
