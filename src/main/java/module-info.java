module com.example.requestremontdesktop {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires org.postgresql.jdbc;


    opens com.example.requestremontdesktop to javafx.fxml;
    exports com.example.requestremontdesktop;

    opens com.example.requestremontdesktop.db to javafx.fxml;
    exports com.example.requestremontdesktop.db;

    opens com.example.requestremontdesktop.models to javafx.fxml;
    exports com.example.requestremontdesktop.models;
}