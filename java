import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Represents a point of interest
class PointOfInterest {
    private String name;
    private String type;
    private String description;

    public PointOfInterest(String name, String type, String description) {
        this.name = name;
        this.type = type;
        this.description = description;
    }

    public String getName() { return name; }
    public String getType() { return type; }
    public String getDescription() { return description; }

    @Override
    public String toString() {
        return "Name: " + name + ", Type: " + type + ", Description: " + description;
    }
}

// Manages information about Haridwar
public class HaridwarInfoSystem {
    private Map<String, String> cityFacts;
    private List<PointOfInterest> pointsOfInterest;

    public HaridwarInfoSystem() {
        cityFacts = new HashMap<>();
        cityFacts.put("Location", "Uttarakhand, India");
        cityFacts.put("Population", "Approx. 230,000 (2023)");
        cityFacts.put("Known For", "Hindu pilgrimage site, Ganga Aarti, and temples");

        pointsOfInterest = new ArrayList<>();
        pointsOfInterest.add(new PointOfInterest("Har Ki Pauri", "Ghat", "The most sacred ghat in Haridwar, known for the evening Ganga Aarti."));
        pointsOfInterest.add(new PointOfInterest("Mansa Devi Temple", "Religious Site", "A popular temple on a hilltop, accessible by ropeway."));
        pointsOfInterest.add(new PointOfInterest("Chandi Devi Temple", "Religious Site", "Another hilltop temple dedicated to Goddess Chandi."));
    }

    public void getCityFact(String factName) {
        if (cityFacts.containsKey(factName)) {
            System.out.println(factName + ": " + cityFacts.get(factName));
        } else {
            System.out.println("Fact not found: " + factName);
        }
    }

    public void searchPointsOfInterest(String searchTerm) {
        System.out.println("\n--- Search Results for '" + searchTerm + "' ---");
        boolean found = false;
        for (PointOfInterest poi : pointsOfInterest) {
            if (poi.getName().contains(searchTerm) || poi.getType().contains(searchTerm)) {
                System.out.println(poi.toString());
                System.out.println("----------------------------------------");
                found = true;
            }
        }
        if (!found) {
            System.out.println("No matching points of interest found.");
        }
    }

    public static void main(String[] args) {
        HaridwarInfoSystem infoSystem = new HaridwarInfoSystem();
        infoSystem.getCityFact("Population");
        infoSystem.getCityFact("Known For");
        infoSystem.searchPointsOfInterest("Temple");
        infoSystem.searchPointsOfInterest("Ghat");
    }
}
