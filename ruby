# Represents a landmark or point of interest
class Landmark
  attr_reader :name, :type, :description

  def initialize(name, type, description)
    @name = name
    @type = type
    @description = description
  end

  def to_s
    "Name: #{name}, Type: #{type}, Description: #{description}"
  end
end

# Represents the city of Haridwar
class HaridwarInfo
  def initialize
    @facts = {
      "Location" => "Uttarakhand, India",
      "Population" => "Approx. 230,000 (2023)",
      "Known For" => "Hindu pilgrimage site, Ganga Aarti, and temples"
    }
    @landmarks = []
    
    add_landmark("Har Ki Pauri", "Ghat", "The most sacred ghat in Haridwar, known for the evening Ganga Aarti.")
    add_landmark("Mansa Devi Temple", "Religious Site", "A popular temple on a hilltop, accessible by ropeway.")
    add_landmark("Chandi Devi Temple", "Religious Site", "Another hilltop temple dedicated to Goddess Chandi.")
  end

  def add_landmark(name, type, description)
    @landmarks << Landmark.new(name, type, description)
  end

  def get_fact(name)
    @facts[name]
  end

  def search_landmarks_by_type(type)
    @landmarks.select { |l| l.type == type }
  end
end

# Main script logic
haridwar = HaridwarInfo.new
puts "Population: #{haridwar.get_fact('Population')}"

puts "\nSearching for religious sites:"
haridwar.search_landmarks_by_type("Religious Site").each { |l| puts l }

puts "\nSearching for ghats:"
haridwar.search_landmarks_by_type("Ghat").each { |l| puts l }
