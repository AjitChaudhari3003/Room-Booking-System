package Ajit;

public class Room {
    private int id;
    private String name;
    private String location;
    private int capacity;
    private String features;
    private String ac_type; // Added this field
    private double pricePerHour;
    private String image;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public String getFeatures() { return features; }
    public void setFeatures(String features) { this.features = features; }

    public String getAc_type() { return ac_type; }
    public void setAc_type(String ac_type) { this.ac_type = ac_type; }

    public double getPricePerHour() { return pricePerHour; }
    public void setPricePerHour(double pricePerHour) { this.pricePerHour = pricePerHour; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}
