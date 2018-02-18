require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

# returns all contacts in an array of hashes with individual name as key and phonenumber as value
def display_contacts
  contacts = read_contacts
  contacts.map {|contact|
    contact[contact[:name]] = contact[:phone];
    contact.delete(:email);
    contact.delete(:name);
    contact.delete(:phone);
  }
  contacts
end

# returns contacts with a phonenumber that includes "+1"
def select_phone
  contacts = read_contacts
  phone_selection = contacts.select { |contact|
    contact.any? { |key, value|
      value.include?('+1')
    }
  }
  phone_selection
end

# returns contacts with an email that contains ".org"
def select_email
  contacts = read_contacts
  email_selection = contacts.select { |contact|
    contact.any? { |key, value|
      value.include?('.org')
    }
  }
  email_selection
end

# returns the amount of contacts that have a phonenumber which includes "+1"
def count_phone
  phone_count = select_phone
  count = phone_count.reduce(0) { |sum, contact|
    sum += 1
  }
  count
end

# returns the amount of contacts that have an email which includes ".org"
def count_email
  email_count = select_email
  count = email_count.reduce(0) { |sum, contact|
    sum += 1
  }
  count
end

puts display_contacts
puts select_phone
puts select_email
puts count_phone
puts count_email
