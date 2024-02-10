package com.example.requestremontdesktop;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.layout.AnchorPane;

public class AddRequestController {

    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private AnchorPane anchorPane;

    @FXML
    private Button btnAddRequest;

    @FXML
    private ComboBox<?> comboBoxEquipment;

    @FXML
    private ComboBox<?> comboBoxExecutor;

    @FXML
    private ComboBox<?> comboBoxPrioritet;

    @FXML
    private ComboBox<?> comboBoxStatus;

    @FXML
    private ComboBox<?> comboBoxTypeOfMalfunctions;

    @FXML
    private DatePicker dateUpdate;

    @FXML
    void initialize() {

    }

}