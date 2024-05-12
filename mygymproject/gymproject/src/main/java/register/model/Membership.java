package register.model;

public class Membership {
    private int id;
    private String membershipType;
    private double price;
    private String details;
    private int duration;

    public Membership() {
    }

    public Membership(int id, String membershipType, double price, String details, int duration) {
        this.id = id;
        this.membershipType = membershipType;
        this.price = price;
        this.details = details;
        this.duration = duration;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMembershipType() {
        return membershipType;
    }

    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "Membership [id=" + id + ", membershipType=" + membershipType + ", price=" + price + ", details=" + details
                + ", duration=" + duration + "]";
    }
}
