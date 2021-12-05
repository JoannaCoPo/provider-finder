class ProviderFacade
  class << self
    def results_per_name_state(last_name, state_abbreviation, limit = 200)
      # decide where to incorpoate error handling
      response = NpiService.last_name_state(last_name, state_abbreviation, limit)
      create_provider_objects(response)
    end

    def results_per_full_name(first_name, last_name)
      full_name_data = NpiService.first_last_names(first_name, last_name)
      # decide where to incorpoate error handling
      # potentiallly use poros: FullName
      FullName.new(full_name_data)
    end

    def results_per_taxonomy_state(taxonomy_description, state_abbreviation)
      specialty_state_data = NpiService.first_last_names(taxonomy_description, state_abbreviation)
      # decide where to incorpoate error handling
      # potentiallly use poros: SpecialityState
      SpecialityState.new(specialty_state_data)
    end

    def create_provider_objects(response)
      response[:results].map { |data| LastNameState.new(data) }
    end
  end
end
