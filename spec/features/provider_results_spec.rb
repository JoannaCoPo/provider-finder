require 'rails_helper'

RSpec.describe 'provider search results index page' do
  describe 'happy path' do
     before :each do
       visit provider_search_path

       fill_in 'First name', with: ''
       fill_in 'Last name', with: 'stangebye'
       fill_in 'Specialty or area of practice:', with: ''
       fill_in 'Provider location by State', with: 'co'
     end

     it '' do
       expect(current_path).to eq(provider_search_path)
       click_on('Find me a provider!')
       expect(current_path).to eq(provider_results_path)
     end

     it 'displays provider attributes' do
      click_on('Find me a provider!')

      expect(page).to have_content('LARS STANGEBYE')
      expect(page).to have_content('NPI Number: 1093896730')
      expect(page).to have_content('specialty: Family Medicine')
      expect(page).to have_content('816 S 5TH ST SUITE B Montrose, CO 814015765')
      expect(page).to have_content('970-240-4311')
    end

    it 'displays additional info for user' do
     click_on('Find me a provider!')

     expect(page).to have_content('Provider Search Results:')
     expect(page).to have_content('Displaying 1 provider')
   end
  end

  describe 'sad path' do
    it 'display a flash message if the only search input is state', :vcr do
      flash_message = 'At least one the the following fields below'
                       + 'must be completed in addition to State:'
                       + 'First Name, Last Name, or specialty.'

      visit provider_search_path

      fill_in 'First name', with: ''
      fill_in 'Last name', with: ''
      fill_in 'Specialty or area of practice:', with: ''
      fill_in 'Provider location by State', with: 'co'
      click_on('Find me a provider!')

      expect(page).to have_content(flash_message)
      expect(current_path).to eq(provider_search_path)
    end

    it 'alerts user if no results were found via their input', :vcr do
      visit provider_search_path

      fill_in 'First name', with: 'don'
      fill_in 'Last name', with: 'juan'
      fill_in 'Specialty or area of practice:', with: ''
      fill_in 'Provider location by State', with: ''
      click_on('Find me a provider!')

      expect(page).to have_content('No entries found')
      expect(current_path).to eq(provider_results_path)
    end
  end
end
