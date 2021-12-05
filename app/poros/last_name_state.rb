class LastNameState
  attr_reader :full_name, :npi_number, :addresses, :phone
  def initialize(name_state_data)
    @full_name = get_full_name(name_state_data)
    @npi_number = name_state_data[:number]
    @addresses = get_addresses(name_state_data)
    @phone = get_phone(name_state_data)
  end

  def get_full_name(name_state_data)
    first = name_state_data[:basic][:first_name].titlecase
    last = name_state_data[:basic][:last_name].titlecase
    first.concat(" ", last)
  end

  def get_addresses(name_state_data)
    street = name_state_data[:addresses][0][:address_1]
    suite = name_state_data[:addresses][0][:address_2]
    city = name_state_data[:addresses][0][:city].titlecase
    state = name_state_data[:addresses][0][:state]
    zip = name_state_data[:addresses][0][:postal_code].insert(5,'-')
    street.concat(", ", suite, ", ", city, ", ", state, " ", zip)
  end

  def get_phone(name_state_data)
    name_state_data[:addresses][0][:telephone_number]
  end
end
