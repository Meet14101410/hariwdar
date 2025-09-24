#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>
#include <algorithm>

// Represents a point of interest
struct PointOfInterest {
    std::string name;
    std::string type;
    std::string description;
};

// Manages information about Haridwar
class HaridwarInfoSystem {
private:
    std::unordered_map<std::string, std::string> city_facts;
    std::vector<PointOfInterest> points_of_interest;

public:
    HaridwarInfoSystem() {
        city_facts["Location"] = "Uttarakhand, India";
        city_facts["Population"] = "Approx. 230,000 (2023)";
        city_facts["Known For"] = "Hindu pilgrimage site, Ganga Aarti, and temples";

        points_of_interest.push_back({"Har Ki Pauri", "Ghat", "The most sacred ghat in Haridwar, known for the evening Ganga Aarti."});
        points_of_interest.push_back({"Mansa Devi Temple", "Religious Site", "A popular temple on a hilltop, accessible by ropeway."});
        points_of_interest.push_back({"Chandi Devi Temple", "Religious Site", "Another hilltop temple dedicated to Goddess Chandi."});
    }

    void get_city_fact(const std::string& fact_name) const {
        if (city_facts.count(fact_name)) {
            std::cout << fact_name << ": " << city_facts.at(fact_name) << std::endl;
        } else {
            std::cout << "Fact not found: " << fact_name << std::endl;
        }
    }
    
    void search_points_of_interest(const std::string& search_term) const {
        std::cout << "\n--- Search Results for '" << search_term << "' ---" << std::endl;
        bool found = false;
        std::string lower_search_term = search_term;
        std::transform(lower_search_term.begin(), lower_search_term.end(), lower_search_term.begin(), ::tolower);

        for (const auto& poi : points_of_interest) {
            std::string lower_name = poi.name;
            std::transform(lower_name.begin(), lower_name.end(), lower_name.begin(), ::tolower);
            if (lower_name.find(lower_search_term) != std::string::npos || 
                poi.type.find(search_term) != std::string::npos) {
                std::cout << "Name: " << poi.name << std::endl;
                std::cout << "Type: " << poi.type << std::endl;
                std::cout << "Description: " << poi.description << std::endl;
                std::cout << "----------------------------------------" << std::endl;
                found = true;
            }
        }
        if (!found) {
            std::cout << "No matching points of interest found." << std::endl;
        }
    }
};

int main() {
    HaridwarInfoSystem info_system;
    info_system.get_city_fact("Population");
    info_system.get_city_fact("Known For");
    info_system.search_points_of_interest("Temple");
    info_system.search_points_of_interest("Ghat");
    return 0;
}
