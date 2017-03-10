require 'iso_country_codes'


def valid_ISIN?(str)

end

# Takes a two character str and returns true if the str is a valid ISO country code
def valid_ISO?(str)
  # The iso_country_codes gem's ::for_select method provides all name and ISO pairs
  # in an array. Map the second el of each pair to create a list of just ISO codes.
  full_list = IsoCountryCodes.for_select.map { |pair| pair[1] }

  # Check to see if the two char str is in the ISO list
  full_list.include?(str)
end
