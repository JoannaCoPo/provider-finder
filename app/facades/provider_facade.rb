class ProviderFacade
  class << self
    def results_per_name_state
      response = NpiService.last_name_state(last_name, state_abbreviation)
      # decide where to incorpoate error handling
      # potentiallly use poros: LastNameState
    end

    def results_per_full_name
      response = NpiService.first_last_names(first_name, last_name)
      # decide where to incorpoate error handling
      # potentiallly use poros: FullName
    end

    def results_per_taxonomy_state
      response = NpiService.first_last_names(first_name, last_name)
      # decide where to incorpoate error handling
      # potentiallly use poros: SpecialityState
    end
  end
end
