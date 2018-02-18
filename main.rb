require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

@contacts = read_contacts

def display_contacts
  @contacts.map {|contact|
    contact[contact[:name]] = contact[:phone];
    contact.delete(:email);
    contact.delete(:name);
    contact.delete(:phone);
  }
  puts @contacts
end

def select_phone
  phone_selection = @contacts.select { |contact|
    contact.any? { |key, value|
      value.include?('+1')
    }
  }
  return phone_selection
end

def select_email
  email_selection = @contacts.select { |contact|
    contact.any? { |key, value|
      value.include?('.org')
    }
  }
  return email_selection
end

def count_phone
    phone_count = select_phone
    count = phone_count.reduce(0) { |sum, contact|
    sum += 1
  }
  return count
end

#display_contacts
#puts select_phone
#puts select_email
puts count_phone
