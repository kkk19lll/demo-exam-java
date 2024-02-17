package com.example.requestremontdesktop.db;

import com.example.requestremontdesktop.models.Remont;
import com.example.requestremontdesktop.models.Request;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.*;

public class DbFunctions {

    public static String equipment_id;
    public static String type_of_malfunction_id;
    public static String executor_id;
    public static String prioritet_id;
    public static String status_request_id;

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

    public ObservableList<String> getEquipments() {
        ObservableList<String> equipments = FXCollections.observableArrayList();
        try {
            ResultSet resultSet = connect_to_db().createStatement().executeQuery("SELECT * FROM equipments");
            while (resultSet.next()) {
                String equipment = resultSet.getString("name");
                equipment_id = resultSet.getString("id");
                equipments.add(equipment);
            }
            return equipments;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return equipments;
        }
    }

    public ObservableList<String> getTypeOfMalfunctions() {
        ObservableList<String> typeOfMalfunctions = FXCollections.observableArrayList();
        try {
            ResultSet resultSet = connect_to_db().createStatement().executeQuery("SELECT * FROM type_of_malfunctions");
            while (resultSet.next()) {
                String typeOfMalfunction = resultSet.getString("name");
                type_of_malfunction_id = resultSet.getString("id");
                typeOfMalfunctions.add(typeOfMalfunction);
            }
            return typeOfMalfunctions;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return typeOfMalfunctions;
        }
    }

    public ObservableList<String> getExecutors() {
        ObservableList<String> executors = FXCollections.observableArrayList();
        try {
            ResultSet resultSet = connect_to_db().createStatement().executeQuery("SELECT * FROM executors");
            while (resultSet.next()) {
                String executor = resultSet.getString("last_name");
                executor_id = resultSet.getString("id");
                executors.add(executor);
            }
            return executors;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return executors;
        }
    }

    public ObservableList<String> getPrioritets() {
        ObservableList<String> prioritets = FXCollections.observableArrayList();
        try {
            ResultSet resultSet = connect_to_db().createStatement().executeQuery("SELECT * FROM prioritets");
            while (resultSet.next()) {
                String prioritet = resultSet.getString("name");
                prioritet_id = resultSet.getString("id");
                prioritets.add(prioritet);
            }
            return prioritets;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return prioritets;
        }
    }

    public ObservableList<String> getStatusesRequest() {
        ObservableList<String> statuses = FXCollections.observableArrayList();
        try {
            ResultSet resultSet = connect_to_db().createStatement().executeQuery("SELECT * FROM statuses_request");
            while (resultSet.next()) {
                String status = resultSet.getString("name");
                status_request_id = resultSet.getString("id");
                statuses.add(status);
            }
            return statuses;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return statuses;
        }
    }

    public void addRequest(String date_update, String equipment_id, String type_of_malfunction_id,
                           String description_of_problem, String user_id, String executor_id, String prioritet_id, String status_request_id) {
        try {
            String query = String.format("insert into requests(date_update, equipment_id, type_of_malfunction_id, description_of_problem, user_id, executor_id, prioritet_id, status_request_id) " +
                            "values('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');",
                    date_update, equipment_id, type_of_malfunction_id, description_of_problem, user_id, executor_id, prioritet_id, status_request_id);
            Statement statement = connect_to_db().createStatement();
            statement.executeUpdate(query);
            System.out.println("Заявка успешно добавлена!");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ObservableList<Remont> getRemonts() {
        ObservableList<Remont> remonts = FXCollections.observableArrayList();
        try {
            ResultSet resultSet = connect_to_db().createStatement().executeQuery("SELECT remonts.id, remonts.name, remonts.description, remonts.time_remont, remonts.price_of_remont, statuses_remont.name as status_remont_name, cause_of_malfunctions.name as cause_of_malfunction_name \n" +
                    "FROM remonts, statuses_remont, cause_of_malfunctions\n" +
                    "WHERE remonts.status_remont_id = statuses_remont.id\n" +
                    "AND remonts.cause_of_malfunction_id = cause_of_malfunctions.id");
            while (resultSet.next()) {
                remonts.add(new Remont(
                        resultSet.getString("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getString("time_remont"),
                        resultSet.getString("price_of_remont"),
                        resultSet.getString("status_remont_name"),
                        resultSet.getString("cause_of_malfunction_name")
                ));
            }
            return remonts;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return remonts;
        }
    }
}
