package com.example.requestremontdesktop.models;

public class Request {
    String id, date_update, equipment_name, type_of_malfunction_name, description_of_problem, user_last_name, prioritet_name, statuses_request_name;

    public Request(String id, String date_update, String equipment_name, String type_of_malfunction_name, String description_of_problem, String user_last_name, String prioritet_name, String statuses_request_name) {
        this.id = id;
        this.date_update = date_update;
        this.equipment_name = equipment_name;
        this.type_of_malfunction_name = type_of_malfunction_name;
        this.description_of_problem = description_of_problem;
        this.user_last_name = user_last_name;
        this.prioritet_name = prioritet_name;
        this.statuses_request_name = statuses_request_name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate_update() {
        return date_update;
    }

    public void setDate_update(String date_update) {
        this.date_update = date_update;
    }

    public String getEquipment_name() {
        return equipment_name;
    }

    public void setEquipment_name(String equipment_name) {
        this.equipment_name = equipment_name;
    }

    public String getType_of_malfunction_name() {
        return type_of_malfunction_name;
    }

    public void setType_of_malfunction_name(String type_of_malfunction_name) {
        this.type_of_malfunction_name = type_of_malfunction_name;
    }

    public String getDescription_of_problem() {
        return description_of_problem;
    }

    public void setDescription_of_problem(String description_of_problem) {
        this.description_of_problem = description_of_problem;
    }

    public String getUser_last_name() {
        return user_last_name;
    }

    public void setUser_last_name(String user_last_name) {
        this.user_last_name = user_last_name;
    }

    public String getPrioritet_name() {
        return prioritet_name;
    }

    public void setPrioritet_name(String prioritet_name) {
        this.prioritet_name = prioritet_name;
    }

    public String getStatuses_request_name() {
        return statuses_request_name;
    }

    public void setStatuses_request_name(String statuses_request_name) {
        this.statuses_request_name = statuses_request_name;
    }
}
