require 'will_paginate/array'

class ProvidersController < ApplicationController
  def search;end

  def index
    begin
      array = call_provider_facade
    rescue => e
      flash[:alert] = flash_message
      redirect_to provider_search_path
    end
    return @providers = array.paginate(page: params[:page], per_page: 20) if !array.nil?
  end

  private
  def call_provider_facade
    ProviderFacade.provider_data(params[:first_name], params[:last_name], params[:specialty], params[:state])
  end
end
