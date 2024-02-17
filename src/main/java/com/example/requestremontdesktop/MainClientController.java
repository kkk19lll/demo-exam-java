package com.example.requestremontdesktop;

import java.io.IOException;

import com.example.requestremontdesktop.db.DbFunctions;
import com.example.requestremontdesktop.models.Remont;
import com.example.requestremontdesktop.models.Request;
import com.example.requestremontdesktop.models.SceneModel;
import com.example.requestremontdesktop.models.StageModel;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class MainClientController {

    @FXML
    private AnchorPane anchorPane;

    @FXML
    private AnchorPane anchorPaneRemont;

    @FXML
    private AnchorPane anchorPaneRequests;

    @FXML
    private Button btnExit;

    @FXML
    private Button btnRemont;

    @FXML
    private Button btnRequests;

    @FXML
    private TableColumn<?, ?> causeOfMalfunctionColumnRemont;

    @FXML
    private TableColumn<?, ?> clientColumnRequests;

    @FXML
    private TableColumn<?, ?> dateUpdateColumnRequests;

    @FXML
    private TableColumn<?, ?> descriptionColumnRemont;

    @FXML
    private TableColumn<?, ?> descriptionOfProblemCOlumnRequests;

    @FXML
    private TableColumn<?, ?> equipmentColumnRequests;

    @FXML
    private TableColumn<?, ?> executorColumnRequests;

    @FXML
    private TableColumn<?, ?> idColumnRemont;

    @FXML
    private TableColumn<?, ?> idColumnRequests;

    @FXML
    private ImageView imageBtnAddRequest;

    @FXML
    private TableColumn<?, ?> nameColumnRemont;

    @FXML
    private TableColumn<?, ?> priceColumnRemont;

    @FXML
    private TableColumn<?, ?> prioritetColumnRequests;

    @FXML
    private TextField requestSearchField;

    @FXML
    private TableColumn<?, ?> statusColumnRemont;

    @FXML
    private TableColumn<?, ?> statusColumnRequests;

    @FXML
    private TableView<Remont> tableViewRemont;

    @FXML
    private TableView<Request> tableViewRequests;

    @FXML
    private TableColumn<?, ?> timeColumnRemont;

    @FXML
    private TableColumn<?, ?> typeOfMalfunctionsColumnRequests;

    private final DbFunctions dbFunctions = new DbFunctions();

    @FXML
    void initialize() {
        btnExit.setOnAction(e -> {
            new RequestRemontApplication().openNewScene(anchorPane, "/com/example/requestremontdesktop/login-view.fxml", "Авторизация");
            anchorPane.getScene().getWindow().hide();
            Stage stage = new Stage();
            StageModel.setMyStage(stage);
            FXMLLoader fxmlLoader = new FXMLLoader(RequestRemontApplication.class.getResource("login-view.fxml"));
            Scene scene = null;
            try {
                scene = new Scene(fxmlLoader.load(), 289, 302);
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
            SceneModel.setMyScene(scene);
            stage.setTitle("Авторизация");
            stage.setScene(scene);
            stage.show();
        });
        btnRequests.setOnAction(e -> {
            anchorPaneRequests.setVisible(true);
            anchorPaneRemont.setVisible(false);
        });
        btnRemont.setOnAction(e -> {
            anchorPaneRequests.setVisible(false);
            anchorPaneRemont.setVisible(true);
        });
        imageBtnAddRequest.setOnMouseClicked(e -> {
            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/example/requestremontdesktop/add-request-view.fxml"));
                Parent parent = loader.load();
                Stage stage = new Stage();
                stage.initModality(Modality.APPLICATION_MODAL);
                stage.setScene(new Scene(parent));
                stage.setTitle("Добавление заявки");
                stage.showAndWait();
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        });
        installTableViewRequests();
        installTableViewRemont();
        searchRequests();
    }

    private void installTableViewRemont() {
        idColumnRemont.setCellValueFactory(new PropertyValueFactory<>("id"));
        nameColumnRemont.setCellValueFactory(new PropertyValueFactory<>("name"));
        descriptionColumnRemont.setCellValueFactory(new PropertyValueFactory<>("description"));
        timeColumnRemont.setCellValueFactory(new PropertyValueFactory<>("time_remont"));
        priceColumnRemont.setCellValueFactory(new PropertyValueFactory<>("price_of_remont"));
        statusColumnRemont.setCellValueFactory(new PropertyValueFactory<>("status_remont_name"));
        causeOfMalfunctionColumnRemont.setCellValueFactory(new PropertyValueFactory<>("cause_of_malfunction_name"));

        tableViewRemont.setItems(dbFunctions.getRemonts());
    }

    private void installTableViewRequests() {
        idColumnRequests.setCellValueFactory(new PropertyValueFactory<>("id"));
        dateUpdateColumnRequests.setCellValueFactory(new PropertyValueFactory<>("date_update"));
        equipmentColumnRequests.setCellValueFactory(new PropertyValueFactory<>("equipment_name"));
        typeOfMalfunctionsColumnRequests.setCellValueFactory(new PropertyValueFactory<>("type_of_malfunction_name"));
        descriptionOfProblemCOlumnRequests.setCellValueFactory(new PropertyValueFactory<>("description_of_problem"));
        clientColumnRequests.setCellValueFactory(new PropertyValueFactory<>("user_last_name"));
        executorColumnRequests.setCellValueFactory(new PropertyValueFactory<>("executor_last_name"));
        prioritetColumnRequests.setCellValueFactory(new PropertyValueFactory<>("prioritet_name"));
        statusColumnRequests.setCellValueFactory(new PropertyValueFactory<>("statuses_request_name"));

        tableViewRequests.setItems(dbFunctions.getRequests());
    }

    private void searchRequests() {
        FilteredList<Request> filteredList = new FilteredList<>(dbFunctions.getRequests(), b -> true);
        requestSearchField.textProperty().addListener(((observable, oldValue, newValue) -> {
            filteredList.setPredicate(request -> {
                if (newValue.isEmpty() || newValue.isBlank() || newValue == null) {
                    return true;
                }

                String searchRequests = newValue.toLowerCase();

                if (request.getId().toLowerCase().contains(searchRequests)) {
                    return true;
                } else if (request.getExecutor_last_name().toLowerCase().contains(searchRequests)) {
                    return true;
                } else {
                    return false;
                }
            });
        }));

        SortedList<Request> sortedListRequest = new SortedList<>(filteredList);

        sortedListRequest.comparatorProperty().bind(tableViewRequests.comparatorProperty());

        tableViewRequests.setItems(sortedListRequest);
    }


}
