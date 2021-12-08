class ApplicationController < ActionController::Base
  # rescue_from StandardError, with: :add_search_criteria
  helper_method :flash_message
  # def add_search_criteria
  #   flash[:error] = message
  #   redirect_back(fallback_location: provider_search_path)
  # end
  #
  def flash_message
    'At least one the the following fields
    below must be completed in addition to
    State: First Name, Last Name, or Specialty.'
  end
end
