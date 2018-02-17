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
  puts phone_selection
end

def select_email
  email_selection = @contacts.select { |contact|
    contact.any? { |key, value|
      value.include?('.org')
    }
  }
  puts email_selection
end

display_contacts
select_phone
select_email
