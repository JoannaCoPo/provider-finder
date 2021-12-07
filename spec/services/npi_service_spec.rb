require 'rails_helper'

RSpec.describe NpiService do
  describe 'happy path' do
    it 'retreives provider data per last name and state abbreviation', :vcr do
      response = NpiService.get_provider_data('', 'cortes', '', 'co', 200)

      expect(response).to be_a(Hash)
      expect(response[:result_count]).to eq(2)
      expect(response[:results][0][:basic][:last_name]).to eq('CORTES')
      expect(response[:results][0][:addresses][0][:state]).to eq('CO')
    end

    it 'retreives provider data per first and last names', :vcr do
      response = NpiService.get_provider_data('joe', 'berg', '', '', 200)

      expect(response).to be_a(Hash)
      expect(response[:result_count]).to eq(3)

      expect(response[:results][0][:basic][:name]).to eq('BERG JOSEPH')
      expect(response[:results][0][:addresses][0][:state]).to eq('GA')

      expect(response[:results][1][:basic][:name]).to eq('BERG JOSEPH')
      expect(response[:results][1][:addresses][0][:state]).to eq('IA')

      expect(response[:results][2][:basic][:name]).to eq('BERG JOSEPH')
      expect(response[:results][2][:addresses][0][:state]).to eq('FL')
    end

    it 'retreives provider data per exact specialty and state abbreviation', :vcr do
      response = NpiService.get_provider_data('', '', 'pediatric cardiology', 'co', 200)

      expect(response).to be_a(Hash)
      expect(response[:result_count]).to eq(127)

      expect(response[:results][0][:basic][:name]).to eq('MILLER DAVID')
      expect(response[:results][0][:addresses][0][:state]).to eq('CO')

      expect(response[:results][126][:basic][:name]).to eq('GIST KATJA')
      expect(response[:results][126][:practiceLocations][0][:state]).to eq('CO')
    end
  end

  describe 'sad path' do
    it 'returns an error message if search params are left blank', :vcr do
      response = NpiService.get_provider_data('', '', '', '', '')
      error_message = response[:Errors].first[:description]

      expect(response).to be_a Hash
      expect(error_message).to eq("No valid search criteria provided")
    end

    it 'returns an error message if only the city param is provided', :vcr do
      response = NpiService.get_provider_data('', '', '', 'TX', '')
      error_message = response[:Errors].first[:description]

      expect(response).to be_a Hash
      expect(error_message).to eq("field state requires additional search criteria")
    end
  end
end
