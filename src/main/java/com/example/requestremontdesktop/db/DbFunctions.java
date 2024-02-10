package com.example.requestremontdesktop.db;

import com.example.requestremontdesktop.models.Request;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;

public class DbFunctions {
    public Connection connect_to_db() {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/" + "request_remont_db", "postgres", "123");
            if (connection != null) {
                System.out.println("Подключение успешно!");
            } else {
                System.out.println("Подключение безуспешно!");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return connection;
    }

    public int loginUser(String login, String password) {
        try {
            String query = String.format("select * from users where login='%s' and password='%s'", login, password);
            Statement statement = connect_to_db().createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if (!resultSet.next()) {
                return 0;
            }
            Variables.ROLE_USER = resultSet.getString("role_id");
            Variables.ACTIVE_USER_LOGIN = resultSet.getString("login");
            Variables.ACTIVE_USER_PASSWORD = resultSet.getString("password");
            Variables.ACTIVE_USER_LAST_NAME = resultSet.getString("last_name");
            Variables.ACTIVE_USER_FIRST_NAME = resultSet.getString("first_name");
            Variables.ACTIVE_USER_MIDDLE_NAME = resultSet.getString("middle_name");
            Variables.ACTIVE_USER_ID = resultSet.getString("id");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 404;
        }
        return 201;
    }

    public ObservableList<Request> getRequests() {
        ObservableList<Request> requests = FXCollections.observableArrayList();
        try {
            ResultSet resultSet = connect_to_db().createStatement().executeQuery("SELECT requests.id, requests.date_update, equipments.name as equipment_name, type_of_malfunctions.name as type_of_malfunction_name, \n" +
                    "requests.description_of_problem, users.last_name as user_last_name, executors.last_name as executor_last_name, prioritets.name as prioritet_name, \n" +
                    "statuses_request.name as statuses_request_name\n" +
                    "FROM requests, equipments, type_of_malfunctions, users, prioritets, statuses_request, executors\n" +
                    "WHERE requests.equipment_id = equipments.id\n" +
                    "AND requests.type_of_malfunction_id = type_of_malfunctions.id\n" +
                    "AND requests.user_id = users.id\n" +
                    "AND requests.prioritet_id = prioritets.id\n" +
                    "AND requests.status_request_id = statuses_request.id\n" +
                    "AND requests.executor_id = executors.id");
            while (resultSet.next()) {
                requests.add(new Request(
                        resultSet.getString("id"),
                        resultSet.getString("date_update"),
                        resultSet.getString("equipment_name"),
                        resultSet.getString("type_of_malfunction_name"),
                        resultSet.getString("description_of_problem"),
                        resultSet.getString("user_last_name"),
                        resultSet.getString("executor_last_name"),
                        resultSet.getString("prioritet_name"),
                        resultSet.getString("statuses_request_name")
                ));
            }
            return requests;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return requests;
        }
    }

}
