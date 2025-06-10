package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.ITravelItineraryDAO;
import com.tourism.dto.TravelItineraryDTO;
import com.tourism.util.DatabaseConnection;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class TravelItineraryDAO implements ITravelItineraryDAO{

    // Method to retrieve itinerary by ID
    public TravelItineraryDTO getItineraryById(int itineraryId) {
        TravelItineraryDTO itinerary = null;
        String query = "SELECT * FROM travel_itineraries WHERE itinerary_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, itineraryId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
            	List<String> activitiesList = Arrays.asList(rs.getString("activities").split(","));
                itinerary = new TravelItineraryDTO(
                    rs.getInt("itinerary_id"),
                    rs.getInt("package_id"),
                    activitiesList,
                    rs.getDate("start_date"),
                    rs.getDate("end_date")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return itinerary;
    }

    // Method to add a new itinerary
    public boolean addItinerary(TravelItineraryDTO itinerary) {
        String query = "INSERT INTO travel_itineraries (package_id, activities, start_date, end_date) VALUES (?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, itinerary.getPackageId());
            stmt.setString(2, String.join(",", itinerary.getActivities()));
            stmt.setDate(3, new java.sql.Date(itinerary.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(itinerary.getEndDate().getTime()));

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
