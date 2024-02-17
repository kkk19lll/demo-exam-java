package com.example.requestremontdesktop;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.ResourceBundle;

import com.example.requestremontdesktop.db.DbFunctions;
import com.example.requestremontdesktop.db.Variables;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;

import static com.example.requestremontdesktop.db.DbFunctions.*;

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
    private ComboBox<String> comboBoxEquipment;

    @FXML
    private ComboBox<String> comboBoxExecutor;

    @FXML
    private ComboBox<String> comboBoxPrioritet;

    @FXML
    private ComboBox<String> comboBoxStatus;

    @FXML
    private ComboBox<String> comboBoxTypeOfMalfunctions;

    @FXML
    private DatePicker dateUpdate;

    @FXML
    private TextField textFiledDescriptionOfProblem;

    private final DbFunctions dbFunctions = new DbFunctions();

    @FXML
    void initialize() {
        installComboBox();
        btnAddRequest.setOnAction(e -> {
            addRequest();
        });
    }

    private void addRequest() {
        if (dateUpdate == null) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Дата добавления пустая!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        }
        else if (comboBoxEquipment.getSelectionModel().isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Выпадающий список оборудования пустой!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        }
        else if (comboBoxTypeOfMalfunctions.getSelectionModel().isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Выпадающий список типа неисправности пустой!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        }
        else if (comboBoxExecutor.getSelectionModel().isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Выпадающий список исполнителя пустой!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        }
        else if (comboBoxPrioritet.getSelectionModel().isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Выпадающий список приоритета пустой!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        }
        else if (comboBoxStatus.getSelectionModel().isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Выпадающий список статуса пустой!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        }
        else if (textFiledDescriptionOfProblem.getText().isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Поле ввода описание проблемы пустое!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        }
        else {
            anchorPane.getScene().getWindow().hide();
            dbFunctions.addRequest(dateUpdate.getValue().toString(), equipment_id, type_of_malfunction_id, textFiledDescriptionOfProblem.getText(), Variables.ACTIVE_USER_ID, executor_id, prioritet_id, status_request_id);
        }
    }

    private void installComboBox() {
        comboBoxEquipment.setItems(dbFunctions.getEquipments());
        comboBoxExecutor.setItems(dbFunctions.getExecutors());
        comboBoxPrioritet.setItems(dbFunctions.getPrioritets());
        comboBoxStatus.setItems(dbFunctions.getStatusesRequest());
        comboBoxTypeOfMalfunctions.setItems(dbFunctions.getTypeOfMalfunctions());
    }

}