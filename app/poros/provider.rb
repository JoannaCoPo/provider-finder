class Provider
  attr_reader :full_name, :npi_number, :addresses, :phone, :specialty
  def initialize(data)
    @full_name = get_full_name(data)
    @npi_number = data[:number]
    @addresses = get_addresses(data)
    @phone = get_phone(data)
    @specialty = get_specialty(data)
  end

  def get_full_name(data)
    first = data[:basic][:first_name]
    last = data[:basic][:last_name]
    if !first.nil? && !last.nil?
      first.titlecase
      last.titlecase
      first.concat(" ", last)
    else
      data[:basic][:name]
    end
  end

  def get_addresses(data)
    street = data[:addresses][0][:address_1]
    suite = data[:addresses][0][:address_2]
    city = data[:addresses][0][:city].titlecase
    state = data[:addresses][0][:state]
    # zip = data[:addresses][0][:postal_code].insert(5,'-')
    zip = data[:addresses][0][:postal_code]
    street.concat(" ", suite, " ", city, ", ", state, " ", zip)
  end

  def get_phone(data)
    data[:addresses][0][:telephone_number]
  end

  def get_specialty(data)
    data[:taxonomies][0][:desc]
  end
end
