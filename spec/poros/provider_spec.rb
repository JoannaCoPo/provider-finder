require 'rails_helper'

describe 'image' do
  it 'has desired data to display in last name and state search results UI', :vcr do
    providers = ProviderFacade.provider_data('', 'russo', '', 'co', 3)
    names = providers.map { |p| p.full_name }
    numbers = providers.map { |p| p.npi_number }
    address = providers.last.addresses
    phone_numbers = providers.map { |p| p.phone }
    specialties = providers.map { |p| p.specialty }
    expected_specialties = ["Counselor Addiction (Substance Use Disorder)", "Audiologist", "Nurse Practitioner"]

    expect(providers.all? { |el| el.class == Provider }).to be(true)
    expect(names).to eq(["KRISTIN RUSSO", "ANGELA RUSSO", "SUSAN RUSSO"])
    expect(numbers).to eq([1750737573, 1447795810, 1255477196])
    expect(providers.last.addresses).to eq("1970 E 3RD AVE UNIT 1 Durango, CO 813015056")
    expect(phone_numbers).to eq(["303-443-8500", "719-526-4095", "970-335-2288"])
    expect(specialties).to eq(expected_specialties)
  end
end
