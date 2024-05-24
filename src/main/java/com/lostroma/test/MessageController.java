// src/main/java/com/lostroma/test/MessageController.java
package com.lostroma.test;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessageController {

    @Value("${app.message}")
    private String message;

    @GetMapping("/message")
    public String message() {
        return message;
    }
}
