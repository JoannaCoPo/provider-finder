require 'rails_helper'

RSpec.describe 'provider facade' do
  it 'creates Provider objects for last name and state search', :vcr do
    data = ProviderFacade.provider_data('', 'russo', '', 'co', 20)

    expect(data).to be_an(Array)
    expect(data.all? { |el| el.class == Provider }).to be(true)
    expect(data.first.full_name).to eq("KRISTIN RUSSO")
    expect(data.first.addresses).to eq("1333 IRIS AVE  Boulder, CO 803042226")
    expect(data.last.full_name).to eq("SAMUEL RUSSO")
    expect(data.last.addresses).to eq("2853 NORTH AVE  Grand Junction, CO 815015040")
  end

  it 'creates Provider objects for first name and last name search', :vcr do
    data = ProviderFacade.provider_data('jennifer', 'smith', '', '', 20)

    expect(data).to be_an(Array)
    expect(data.all? { |el| el.class == Provider }).to be(true)
    expect(data.first.full_name).to eq("JENNIFER SMITH")
    expect(data.last.full_name).to eq("JENNIFER SMITH")
  end

  it 'creates Provider objects for specialty and state search', :vcr do
    data = ProviderFacade.provider_data('', '', 'dentist', 'co', 20)

    expect(data).to be_an(Array)
    expect(data.all? { |el| el.class == Provider }).to be(true)
    # expect(data.first.full_name).to eq("KRISTIN RUSSO")
    # expect(data.first.addresses).to eq("1333 IRIS AVE  Boulder, CO 803042226")
    # expect(data.last.full_name).to eq("SAMUEL RUSSO")
    # expect(data.last.addresses).to eq("2853 NORTH AVE  Grand Junction, CO 815015040")
  end
end
