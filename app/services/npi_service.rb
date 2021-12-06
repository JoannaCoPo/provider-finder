class NpiService
  class << self
    # def last_name_state(last_name, state, limit)
    #   response = connection.get("/api/?version=2.0&last_name=#{last_name}&state=#{state}&limit=#{limit}")
    #   JSON.parse(response.body, symbolize_names: true)
    # end
    #
    # def first_last_names(first_name, last_name, limit)
    #   response = connection.get("/api/?version=2.0&first_name=#{first_name}&last_name=#{last_name}&limit=#{limit}")
    #   JSON.parse(response.body, symbolize_names: true)
    # end
    #
    # def taxonomy_state(taxonomy_desc, state, limit)
    #   response = connection.get("/api/?version=2.0&taxonomy_desc=#{taxonomy_desc}&state=#{state}&limit=#{limit}")
    #   JSON.parse(response.body, symbolize_names: true)
    # end

    def all_queries(first_name, last_name,taxonomy_desc, state, limit)
      response = connection.get("/api/?version=2.0&first_name=#{first_name}&last_name=#{last_name}&taxonomy_desc=#{taxonomy_desc}&state=#{state}&limit=#{limit}")
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
