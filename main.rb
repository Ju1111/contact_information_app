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

def select_contacts
  selection = @contacts.select { |contact|
      contact.any? { |key, value|
        value.include?('+1')
      }
     }
  puts selection
end

display_contacts
select_contacts
