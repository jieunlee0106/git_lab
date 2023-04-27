package com.example.nnzcrawling.selenium;

import com.example.nnzcrawling.dto.ResponseShowDTO;
import com.example.nnzcrawling.entity.ShowEntity;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.util.ArrayList;
import java.util.List;

public class CrawlingShows {

    private static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    private static final String WEB_DRIVER_PATH = "C:\\Users\\yyh77\\nnz\\nnz-crawling\\chromedriver.exe";

    public void getCrawlingData() throws InterruptedException {

        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        //크롬 설정을 담은 객체 생성
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--remote-allow-origins=*");

        //브라우저가 눈에 보이지 않고 내부적으로 돈다.
        //설정하지 않을 시 실제 크롬 창이 생성되고, 어떤 순서로 진행되는지 확인할 수 있다.
//        options.addArguments("headless");

        //위에서 설정한 옵션은 담은 드라이버 객체 생성
        //옵션을 설정하지 않았을 때에는 생략 가능하다.
        //WebDriver객체가 곧 하나의 브라우저 창이라 생각한다.
        WebDriver driver = new ChromeDriver(options);

        //이동을 원하는 url
        String url = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=%EA%B3%B5%EC%97%B0";

        //WebDriver을 해당 url로 이동한다.
        driver.get(url);

        //브라우저 이동시 생기는 로드시간을 기다린다.
        //HTTP응답속도보다 자바의 컴파일 속도가 더 빠르기 때문에 임의적으로 1초를 대기한다.
        Thread.sleep(1000);

        // WebElement는 html의 태그를 가지는 클래스이다

        List<ResponseShowDTO> shows = new ArrayList<>();

        // 1번 인덱스는 전체 탭이므로 스킵
        int categoryCnt = 2;
        while (categoryCnt <= 8) {

            Thread.sleep(1000);
            // 공연의 카테고리 선택하기.
            WebElement selectCategory =
                    driver.findElement(
                            By.cssSelector(
                                    "div.list_type.switch > div > div > div.lego_scroll_middle > div > div > ul > li:nth-child(" + categoryCnt + ") > a"
                            ));

            String category = selectCategory.getText();
            // 카테고리 하나 클릭
            selectCategory.sendKeys(Keys.ENTER);

            Thread.sleep(1000);

            int regionCnt = 2;

            // 공연 카테고리 선택 후 지역 목록 선택하기
            while (regionCnt <= 16) {

                WebElement regionSelectBox = null;
                if (categoryCnt <= 6) {
                    regionSelectBox = driver.findElement(By.cssSelector("div.cm_content_wrap > div > div > div.cm_tap_area.type_performance > div > div > ul > li:nth-child(2) > a"));
                } else {
                    regionSelectBox = driver.findElement(By.cssSelector("div.cm_content_wrap > div > div > div.cm_tap_area.type_performance > div > div > ul > li:nth-child(1) > a"));
                }
                regionSelectBox.sendKeys(Keys.ENTER);

                Thread.sleep(1000);

                // 지역 선택
                WebElement regions = null;
                if (categoryCnt <= 6) {
                    regions = driver.findElement(
                            By.cssSelector(
                                    "div.cm_content_wrap > div > div > div.cm_tap_area.type_performance > div > div > ul > li:nth-child(2) > div > div > div > div > div > ul > li:nth-child(" + regionCnt + ") > a"
                                    //div.cm_content_wrap > div > div > div.cm_tap_area.type_performance > div > div > ul > li:nth-child(2) > div > div > div > div > div > ul > li:nth-child(2) > a
                            ));
                } else {
                    regions = driver.findElement(
                            By.cssSelector(
                                    "div.cm_content_wrap > div > div > div.cm_tap_area.type_performance > div > div > ul > li:nth-child(1) > div > div > div > div > div > ul > li:nth-child(" + regionCnt + ") > a"
                            ));
                }

                String selectRegion = regions.getText();
                Thread.sleep(1000);
                try {
                    regions.sendKeys(Keys.ENTER);
                } catch (Exception e) {
                    System.out.println(categoryCnt);
                    if (categoryCnt <= 6) {
                        regions = driver.findElement(
                                By.cssSelector(
                                        "div.cm_content_wrap > div > div > div.cm_tap_area.type_performance > div > div > ul > li:nth-child(2) > div > div > div > div > div > ul > li:nth-child(" + regionCnt + ") > a"
                                ));
                    } else {
                        regions = driver.findElement(
                                By.cssSelector(
                                        "div.cm_content_wrap > div > div > div.cm_tap_area.type_performance > div > div > ul > li:nth-child(1) > div > div > div > div > div > ul > li:nth-child(" + regionCnt + ") > a"
                                ));
                    }

                    Thread.sleep(1000);
                    regions.sendKeys(Keys.ENTER);
                }
                Thread.sleep(1000);

                // 지역 선택했으면 페이징 처리된 만큼 반복문 진행
                // 페이징 개수 구하기 위한 변수
                int totalPage = 0;

                try {
                    totalPage = Integer.parseInt(
                            driver.findElement(
                                    By.cssSelector(
                                            "div.cm_content_wrap > div > div > div._info > div.cm_paging_area > div > span > span._total"
                                    )).getText());
                } catch (NumberFormatException e) {
                    totalPage = 0;
                }
                int kk = 1;
                for (int k = 1; k < totalPage; k++) {

                    // 다음 버튼 누르기
                    for (int i = 1; i < kk; i++) {
                        driver.navigate().back();
                        Thread.sleep(1000);
                    }

                    List<WebElement> showList = driver.findElements(
                            By.cssSelector(
                                    "div.cm_content_wrap > div > div > div._info > div.list_image_info.type_pure._panel_wrapper > ul:nth-child(" + k + ") > li > a"
                            ));

                    // 공연 정보들의 태그를 리스트에 담고 해당 리스트에서 <a> 태그 정보를 받아와 url 이동.
                    // 해당 메소드에서는 태그 정보만 담는다.
                    showList.forEach(element -> {
                        shows.add(new ResponseShowDTO(element, element.getAttribute("href"), category, selectRegion));
                    });

                    WebElement nextBtn = driver.findElement(By.cssSelector("div.cm_content_wrap > div > div > div._info > div.cm_paging_area > div > a.pg_next.on"));
                    nextBtn.sendKeys(Keys.ENTER);
                    Thread.sleep(1000);
                }
                regionCnt++;

                Thread.sleep(1000);
                kk++;
            }
            categoryCnt++;
        }

        List<ShowEntity> responses = getShowInfo(driver, shows);

        for (
                ShowEntity entity : responses) {
            System.out.println(entity);
        }

        try {
            //드라이버가 null이 아니라면
            if (driver != null) {
                //드라이버 연결 종료
                driver.close(); //드라이버 연결 해제

                //프로세스 종료
                driver.quit();
            }
        } catch (
                Exception e) {
            throw new RuntimeException(e.getMessage());
        }

    }

    private List<ShowEntity> getShowInfo(WebDriver driver, List<ResponseShowDTO> shows) {

        List<ShowEntity> responses = new ArrayList<>();

        shows.forEach(v -> {
            ShowEntity showEntity = new ShowEntity();

            driver.get(v.getHref());

            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            // 공연 제목
            String title = null;
            try {
                title = driver.findElement(By.cssSelector("div.cm_top_wrap._sticky._custom_select._header > div.title_area.type_keep._title_area > h2 > span.area_text_title > strong")).getText();
            } catch (Exception e) {
                return;
            }
            showEntity.setTitle(title);

            // 공연 장소 - ~박물관, ~공연장
            String location = null;
            try {
                location = driver.findElement(
                        By.cssSelector(
                                "div > div.detail_info._default_info > dl > div:nth-child(4) > dd > a"
                        )).getText();
            } catch (Exception e) {
                try {
                    location = driver.findElement(
                            By.cssSelector(
                                    "div > div.detail_info._default_info > dl > div:nth-child(3) > dd > a"
                            )).getText();
                } catch (Exception e2) {
                    location = driver.findElement(
                            By.cssSelector(
                                    "div > div.detail_info > dl > div:nth-child(3) > dd"
                            )).getText();
                    System.out.println(location);
                }
            }
            showEntity.setLocation(location);

            // 시작 일자
            String startDate = null;
            // 종료 일자
            String endDate = null;

            WebElement dateElement = null;
            try {
                dateElement = driver.findElement(By.cssSelector("div.cm_content_wrap._content > div > div > div.detail_info._default_info > dl > div:nth-child(2) > dd")).findElement(By.cssSelector("span:nth-child(2)"));
                startDate = driver.findElement(
                        By.cssSelector(
                                "div.cm_content_wrap._content > div > div > div.detail_info._default_info > dl > div:nth-child(2) > dd > span:nth-child(1)"
                        )).getText();

                endDate = driver.findElement(By.cssSelector("div.cm_content_wrap._content > div > div > div.detail_info._default_info > dl > div:nth-child(2) > dd > span:nth-child(2)")).getText();
            } catch (Exception e) {
                try {
                    startDate = driver.findElement(By.cssSelector("div.cm_content_wrap._content > div > div > div.detail_info._default_info > dl > div:nth-child(2) > dd")).getText();
                    endDate = "";
                } catch (Exception e2) {
                    startDate = driver.findElement(
                            By.cssSelector(
                                    "div > div:nth-child(1) > div > div.detail_info > dl > div:nth-child(2) > dd > span"
                            )).getText();
                    endDate = "";
                    System.out.println(startDate);
                }
            }

            showEntity.setStartDate(startDate);
            showEntity.setEndDate(endDate);

            // 연령 제한
            String ageLimit = null;
            try {
                ageLimit = driver.findElement(By.cssSelector("div.cm_top_wrap._sticky._custom_select._header > div.title_area.type_keep._title_area > div > span:nth-child(3)")).getText();
            } catch (Exception e) {
                ageLimit = "";
            }
            showEntity.setAgeLimit(ageLimit);

            // 지역
            showEntity.setRegion(v.getRegion());

            // 포스터 이미지 url
            String poster = null;
            try {
                poster = driver.findElement(
                        By.cssSelector(
                                "div.cm_content_wrap._content > div.cm_content_area._scroll_mover > div > div.detail_info._default_info > a > img"
                        )).getAttribute("src");
            } catch (Exception e) {
                try {
                    poster = driver.findElement(
                            By.cssSelector(
                                    "div.cm_content_wrap._content > div.cm_content_area._scroll_mover > div > div.detail_info._default_info > span > img"
                            )).getAttribute("src");
                } catch (Exception e2) {
                    poster = driver.findElement(
                            By.cssSelector(
                                    "div.cm_content_wrap._kgs_perform_festival > div > div:nth-child(1) > div > div.detail_info > a > img"
                            )).getAttribute("src");
                }
            }
            showEntity.setPoster(poster);

            // 카테고리
            showEntity.setCategory(v.getCategory());

            System.out.println(showEntity);
        });

        return responses;
    }
}
