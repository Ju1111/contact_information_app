require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

# returns all contacts in an array of hashes with individual name as key and phonenumber as value

def display_contacts
  read_contacts.map {|contact|
    contact[contact[:name]] = contact[:phone];
    contact.delete(:email);
    contact.delete(:name);
    contact.delete(:phone);
    contact
  }
end

# returns contacts with a phonenumber that includes "+1"
def select_phone
  read_contacts.select { |contact|
    contact.any? { |key, value|
      value.include?('+1')
    }
  }
end

# returns contacts with an email that contains ".org"
def select_email
  read_contacts.select { |contact|
    contact.any? { |key, value|
      value.include?('.org')
    }
  }
end

# returns the amount of contacts that have a phonenumber which includes "+1"
def count_phone
  select_phone.reduce(0) { |sum, contact|
    sum += 1
  }
end

# returns the amount of contacts that have an email which includes ".org"
def count_email
  select_email.reduce(0) { |sum, contact|
    sum += 1
  }
end

puts display_contacts
puts select_phone
puts select_email
puts count_phone
puts count_email
