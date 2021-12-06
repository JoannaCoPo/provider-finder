require 'will_paginate/array'

class ProvidersController < ApplicationController
  def search
  end

  def index
    array = ProviderFacade.all_queries(params[:first_name], params[:last_name], params[:taxonomy_desc], params[:state])
    @providers = array.paginate(page: params[:page], per_page: 20)
  end
end
