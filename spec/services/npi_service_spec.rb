require 'rails_helper'

RSpec.describe NpiService do
  it 'retreives provider info per last name and state abbreviation', :vcr do
    response = NpiService.last_name_state("cortes", "co", 200)

    expect(response).to be_a(Hash)
    expect(response[:result_count]).to eq(2)
    expect(response[:results][0][:basic][:last_name]).to eq("CORTES")
    expect(response[:results][0][:addresses][0][:state]).to eq("CO")
  end

  it 'retreives provider info per first and last names', :vcr do
    response = NpiService.first_last_names("joe", "berg", 200)

    expect(response).to be_a(Hash)
    expect(response[:result_count]).to eq(3)

    expect(response[:results][0][:basic][:name]).to eq("BERG JOSEPH")
    expect(response[:results][0][:addresses][0][:state]).to eq("GA")

    expect(response[:results][1][:basic][:name]).to eq("BERG JOSEPH")
    expect(response[:results][1][:addresses][0][:state]).to eq("IA")

    expect(response[:results][2][:basic][:name]).to eq("BERG JOSEPH")
    expect(response[:results][2][:addresses][0][:state]).to eq("FL")
  end

  it 'retreives provider info per exact speciality and state abbreviation', :vcr do
    response = NpiService.taxonomy_state("pediatric cardiology", "co", 200)

    expect(response).to be_a(Hash)
    expect(response[:result_count]).to eq(127)

    expect(response[:results][0][:basic][:name]).to eq("MILLER DAVID")
    expect(response[:results][0][:addresses][0][:state]).to eq("CO")

    expect(response[:results][126][:basic][:name]).to eq("GIST KATJA")
    expect(response[:results][126][:practiceLocations][0][:state]).to eq("CO")
    # Consider how to handle providers with different locations ^^
  end
end

# consdier edge cases and errors
