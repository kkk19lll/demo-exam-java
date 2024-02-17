package com.example.requestremontdesktop.models;

public class Remont {
    String id, name, description, time_remont, price_of_remont, status_remont_name, cause_of_malfunction_name;

    public Remont(String id, String name, String description, String time_remont, String price_of_remont, String status_remont_name, String cause_of_malfunction_name) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.time_remont = time_remont;
        this.price_of_remont = price_of_remont;
        this.status_remont_name = status_remont_name;
        this.cause_of_malfunction_name = cause_of_malfunction_name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTime_remont() {
        return time_remont;
    }

    public void setTime_remont(String time_remont) {
        this.time_remont = time_remont;
    }

    public String getPrice_of_remont() {
        return price_of_remont;
    }

    public void setPrice_of_remont(String price_of_remont) {
        this.price_of_remont = price_of_remont;
    }

    public String getStatus_remont_name() {
        return status_remont_name;
    }

    public void setStatus_remont_name(String status_remont_name) {
        this.status_remont_name = status_remont_name;
    }

    public String getCause_of_malfunction_name() {
        return cause_of_malfunction_name;
    }

    public void setCause_of_malfunction_name(String cause_of_malfunction_name) {
        this.cause_of_malfunction_name = cause_of_malfunction_name;
    }
}
