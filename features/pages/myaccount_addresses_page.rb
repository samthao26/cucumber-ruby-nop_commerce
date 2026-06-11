class MyAccountAddressPage
  include Capybara::DSL
  include RSpec::Matchers
  ADDRESS_LINK = '.customer-addresses a'
  FIRST_NAME_ADDRESS = 'Address_FirstName'
  LAST_NAME_ADDRESS = 'Address_LastName'
  EMAIL_ADDRESS = 'Address_Email'
  COMPANY_ADDRESS = 'Address_Company'
  COUNTRY_SELECT_ADDRESS = 'Address_CountryId'
  STATE_SELECT_ADDRESS = 'Address_StateProvinceId'
  CITY_ADDRESS = 'Address_City'
  ADDRESS_1 = 'Address_Address1'
  ADDRESS_2 = 'Address_Address2'
  ZIP_CODE ='Address_ZipPostalCode'
  PHONE_NUMBER_ADDRESS = 'Address_PhoneNumber'
  FAX_NUMBER_ADDRESS = 'Address_FaxNumber'
  ADD_NEW_BUTTON = '.button-1.add-address-button'


  NAME_VERIFY = '.name'
  EMAIL_VERIFY = '.email'
  PHONE_VERIFY = '.phone'
  FAX_VERIFY = '.fax'
  COMPANY_VERIFY = '.company'
  COUNTRY_VERIFY = '.country'
  STATE_VERIFY = '.stateprovince'
  CITY_VERIFY = '.city'
  ADDRESS_1_VERIFY = '.address1'
  ADDRESS_2_VERIFY = '.address2'
  ZIP_CODE_VERIFY = '.zippostalcode'

  def access_address_link
    find(ADDRESS_LINK).click
    end

  def fill_in_address(data)

    fill_in FIRST_NAME_ADDRESS, with: data['first_name']
    fill_in LAST_NAME_ADDRESS, with: data['last_name']
    fill_in EMAIL_ADDRESS, with: data['email']
    fill_in COMPANY_ADDRESS, with: data['company']
    select_country(data["country"]) if data['country']
    select_state(data["state"]) if data['state']
    fill_in CITY_ADDRESS, with: data['city']
    fill_in ADDRESS_1, with: data['address1']
    fill_in ADDRESS_2, with: data['address2']
    fill_in ZIP_CODE, with: data['zip']
    fill_in PHONE_NUMBER_ADDRESS, with: data['phone']
    fill_in FAX_NUMBER_ADDRESS, with: data['fax']

  end
  def select_country(country_name)
    select country_name, from: COUNTRY_SELECT_ADDRESS
  end
  def select_state(state_name)
    if has_select?(STATE_SELECT_ADDRESS, with_options: [state_name], wait:10)
    select state_name, from: STATE_SELECT_ADDRESS
    end
  end
  def click_add_new_button
    find(ADD_NEW_BUTTON).click
  end
  def verify_address(data)
    address_item = page.all('.address-item').last
    expect(address_item.find(NAME_VERIFY).text).to include("#{data['first_name']} #{data['last_name']}")
    expect(address_item.find(EMAIL_VERIFY).text).to include("#{data['email']}")
    expect(address_item.find(PHONE_VERIFY).text).to include("#{data['phone']}")
    expect(address_item.find(FAX_VERIFY).text).to include("#{data['fax']}")
    expect(address_item.find(COMPANY_VERIFY).text).to include("#{data['company']}")
    expect(address_item.find(COUNTRY_VERIFY).text).to include("#{data['country']}")
    if data['state'] && data['state'] != 'Other' && address_item.has_css?(STATE_VERIFY, wait: 2)
      expect(address_item.find(STATE_VERIFY).text).to include("#{data['state']}")
    end
    expect(address_item.find(CITY_VERIFY).text).to include("#{data['city']}")
    expect(address_item.find(ADDRESS_1_VERIFY).text).to include("#{data['address1']}")
    if data['address2'] && !data['address2'].empty?
      expect(address_item.find(ADDRESS_2_VERIFY).text).to include(data['address2'])
    end
    expect(address_item.find(ZIP_CODE_VERIFY).text).to include("#{data['zip']}")

  end

end