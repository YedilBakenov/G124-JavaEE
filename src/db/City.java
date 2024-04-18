package db;

public class City {
    private int id;

    private String region;

    private String city_name;

    public City() {
    }

    public City(int id, String region, String city_name) {
        this.id = id;
        this.region = region;
        this.city_name = city_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCity_name() {
        return city_name;
    }

    public void setCity_name(String city_name) {
        this.city_name = city_name;
    }
}
