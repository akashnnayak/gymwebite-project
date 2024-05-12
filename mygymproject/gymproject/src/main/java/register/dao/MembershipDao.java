package register.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import register.model.Membership;

public class MembershipDao {
    private Connection connection;

    public MembershipDao(Connection connection) {
        this.connection = connection;
    }

    // Method to retrieve all memberships from the database
    public List<Membership> getAllMemberships() {
        List<Membership> memberships = new ArrayList<>();
        String query = "SELECT * FROM membership";

        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String membershipType = resultSet.getString("membership_type");
                double price = resultSet.getDouble("price");
                String details = resultSet.getString("details");
                int duration = resultSet.getInt("duration");

                Membership membership = new Membership(id, membershipType, price, details, duration);
                memberships.add(membership);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return memberships;
    }

    // Method to retrieve a single membership by its ID
    public Membership getMembershipById(int id) {
        Membership membership = null;
        String query = "SELECT * FROM membership WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String membershipType = resultSet.getString("membership_type");
                double price = resultSet.getDouble("price");
                String details = resultSet.getString("details");
                int duration = resultSet.getInt("duration");

                membership = new Membership(id, membershipType, price, details, duration);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return membership;
    }
}
