package com.example.requestremontdesktop;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import com.example.requestremontdesktop.db.DbFunctions;
import com.example.requestremontdesktop.db.Variables;
import com.example.requestremontdesktop.models.SceneModel;
import com.example.requestremontdesktop.models.StageModel;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class LoginController {

    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private AnchorPane anchorPane;

    @FXML
    private Button btnLogin;

    @FXML
    private TextField loginTextFIeld;

    @FXML
    private PasswordField passwordTextField;

    private final DbFunctions dbFunctions = new DbFunctions();

    public static String login;
    public static String password;

    @FXML
    void initialize() {
        btnLogin.setOnAction(e -> {
            try {
                validation();
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        });
    }

    private void validation() throws IOException {
        login = loginTextFIeld.getText();
        password = passwordTextField.getText();
        int codeError = dbFunctions.loginUser(login, password);

        if (login.isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Поле ввода Логин пустое!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        } else if (password.isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Поле ввода Пароль пустое!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        } else if (login.equals(password)) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Логин и пароль не должны совпадать!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        } else if (codeError == 0) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Не найден аккаунт!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        } else if (codeError == 404) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Ошибка");
            alert.setContentText("Какая-та ошибка!");

            ButtonType buttonTypeOk = new ButtonType("Ок");

            alert.getButtonTypes().setAll(buttonTypeOk);

            alert.showAndWait().ifPresent(response -> {
                if (response == buttonTypeOk) {
                    alert.close();
                }
            });
        } else {
            if (Variables.ROLE_USER.equals("4")) {
                new RequestRemontApplication().openNewScene(anchorPane, "/com/example/requestremontdesktop/main-client-view.fxml", "Главное меню");
                anchorPane.getScene().getWindow().hide();
                Stage stage = new Stage();
                StageModel.setMyStage(stage);
                FXMLLoader fxmlLoader = new FXMLLoader(RequestRemontApplication.class.getResource("main-client-view.fxml"));
                Scene scene = new Scene(fxmlLoader.load(), 893, 400);
                SceneModel.setMyScene(scene);
                stage.setTitle("Главное меню");
                stage.setScene(scene);
                stage.show();
            } else if (Variables.ROLE_USER.equals("3")) {
                new RequestRemontApplication().openNewScene(anchorPane, "/com/example/requestremontdesktop/main-executor-view.fxml", "Главное меню");
                anchorPane.getScene().getWindow().hide();
                Stage stage = new Stage();
                StageModel.setMyStage(stage);
                FXMLLoader fxmlLoader = new FXMLLoader(RequestRemontApplication.class.getResource("main-executor-view.fxml"));
                Scene scene = new Scene(fxmlLoader.load(), 893, 400);
                SceneModel.setMyScene(scene);
                stage.setTitle("Главное меню");
                stage.setScene(scene);
                stage.show();
            }
            else if (Variables.ROLE_USER.equals("2")) {
                new RequestRemontApplication().openNewScene(anchorPane, "/com/example/requestremontdesktop/main-employee-view.fxml", "Главное меню");
                anchorPane.getScene().getWindow().hide();
                Stage stage = new Stage();
                StageModel.setMyStage(stage);
                FXMLLoader fxmlLoader = new FXMLLoader(RequestRemontApplication.class.getResource("main-employee-view.fxml"));
                Scene scene = new Scene(fxmlLoader.load(), 893, 400);
                SceneModel.setMyScene(scene);
                stage.setTitle("Главное меню");
                stage.setScene(scene);
                stage.show();
            }

            else if (Variables.ROLE_USER.equals("1")) {
                new RequestRemontApplication().openNewScene(anchorPane, "/com/example/requestremontdesktop/main-admin-view.fxml", "Панель администрирования");
                anchorPane.getScene().getWindow().hide();
                Stage stage = new Stage();
                StageModel.setMyStage(stage);
                FXMLLoader fxmlLoader = new FXMLLoader(RequestRemontApplication.class.getResource("main-admin-view.fxml"));
                Scene scene = new Scene(fxmlLoader.load(), 893, 400);
                SceneModel.setMyScene(scene);
                stage.setTitle("Панель администрирования");
                stage.setScene(scene);
                stage.show();
            }
        }
    }
}
