package com.example.requestremontdesktop;

import com.example.requestremontdesktop.models.SceneModel;
import com.example.requestremontdesktop.models.StageModel;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.Objects;

public class RequestRemontApplication extends Application {
    @Override
    public void start(Stage stage) throws IOException {
        StageModel.setMyStage(stage);
        FXMLLoader fxmlLoader = new FXMLLoader(RequestRemontApplication.class.getResource("login-view.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 289, 302);
        SceneModel.setMyScene(scene);
        stage.setTitle("Авторизация");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }

    public void openNewScene(AnchorPane root, String window, String title) {
        try {
            AnchorPane anchorPane = FXMLLoader.load(Objects.requireNonNull(getClass().getResource(window)));
            root.getChildren().setAll(anchorPane);
            StageModel.getMyStage().setTitle(title);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
}