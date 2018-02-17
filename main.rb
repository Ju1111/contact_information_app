require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def display_contacts
  contacts = read_contacts
  contacts.map {|contact|
    contact[contact[:name]] = contact[:phone];
    contact.delete(:email);
    contact.delete(:name);
    contact.delete(:phone);
  }
  puts contacts
end

display_contacts
