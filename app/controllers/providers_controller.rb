class ProvidersController < ApplicationController
  def search
  end

  def index
    if params[:taxonomy_description]
      @providers = ProviderFacade.results_per_taxonomy_state(specialty_state_params)
    elsif params[:first_name]
      @providers = ProviderFacade.results_per_full_name(full_name_params)
    else
      # ProviderFacade.results_per_name_state(name_state_params)
      @providers = ProviderFacade.results_per_name_state(params[:last_name], params[:state_abbreviation])
    end
  end
end
