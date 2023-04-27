package com.example.nnzcrawling;

import com.example.nnzcrawling.selenium.CrawlingESports;
import com.example.nnzcrawling.selenium.CrawlingShows;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class NnzCrawlingApplication {

    public static void main(String[] args) {

        SpringApplication.run(NnzCrawlingApplication.class, args);

        CrawlingShows crawlingShows = new CrawlingShows();
        CrawlingESports crawlingESports = new CrawlingESports();

        try {
            crawlingESports.getCrawlingData();
//            crawlingShows.getCrawlingData();
        } catch (InterruptedException e) {
            System.out.println(e.getStackTrace());
        }
    }

}
