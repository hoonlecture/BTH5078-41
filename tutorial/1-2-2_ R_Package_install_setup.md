# Untitled

# Packages installation for window

Note. R 3.6.2 or above version recommend an English language setting if you are using Korean as your display language change to English.

## **Change your language setting**

1. Go to the setting (설정) and click the account (계정)

    ![KakaoTalk_Photo_2021-09-06-20-46-36.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-20-46-36.png)

2. Check if the name of your user information is in English

    ![KakaoTalk_Photo_2021-09-06-20-46-31.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-20-46-31.png)

3. If the name of your user information is not in English then go to "family or other users"
(가족 및 다른 사용자) and add the new user **(!!!!Create your user name in English without space or dash!!!!)**

    ![KakaoTalk_Photo_2021-09-06-20-46-52 002.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-20-46-52_002.png)

4. Go to time and language (시간 및 언어) menu and add English if you don't have English as displaying language.

    ![KakaoTalk_Photo_2021-09-06-20-46-52 003.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-20-46-52_003.png)

    ![KakaoTalk_Photo_2021-09-06-20-46-52 006.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-20-46-52_006.png)

    ![KakaoTalk_Photo_2021-09-06-20-46-52 004.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-20-46-52_004.png)

    ![KakaoTalk_Photo_2021-09-06-20-46-52 005.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-20-46-52_005.png)

    ![KakaoTalk_Photo_2021-09-06-20-46-51 001.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-20-46-51_001.png)

5. Search for Rtools3.5 

    ![KakaoTalk_Photo_2021-09-06-21-00-08 001.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-00-08_001.png)

    ![KakaoTalk_Photo_2021-09-06-21-00-08 002.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-00-08_002.png)

    ![KakaoTalk_Photo_2021-09-06-21-00-08 003.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-00-08_003.png)

6. Install Rtools35

(next>>next>> next>>check add rtools to system path >> next >> install >> finish)

![KakaoTalk_Photo_2021-09-06-21-00-08 004.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-00-08_004.png)

![KakaoTalk_Photo_2021-09-06-21-00-08 005.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-00-08_005.png)

![KakaoTalk_Photo_2021-09-06-21-00-08 006.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-00-08_006.png)

![KakaoTalk_Photo_2021-09-06-21-00-08 007.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-00-08_007.png)

1. Run Rstudio as administrator (관리자 권한으로 Rstudio를 실행하세요~!!)
2. Type following code on the R console window

```bash
writeLines('PATH="${RTOOLS_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
```

```bash
> Sys.which("make")
"C:\\Rtools\\bin\\make.exe" ### if you see this you succeed
```

![KakaoTalk_Photo_2021-09-06-21-07-20.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-07-20.png)

1. Then, we will add the .libPaths() where packages will be installed. **Go to This PC >> Local disk (C:) >> Program Files >> R >> R 3.6.2 >> etc >> find Rprofile.site**

    ![KakaoTalk_Photo_2021-09-06-21-16-02.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-16-02.png)

2. Right click the [Rprofile.site](http://rprofile.site) and click the Properties (속성). 
3. Go to Security menu and Click the "USERS" and Click "Edit" 

    ![KakaoTalk_Photo_2021-09-06-21-26-14.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-26-14.png)

4. Click User and Check the "Full control" box and apply & okay. 

    ![KakaoTalk_Photo_2021-09-06-21-26-19.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-26-19.png)

5. Right click the [Rprofile.site](http://rprofile.site) and "Open with" NotePad (메모장)

    ![KakaoTalk_Photo_2021-09-06-21-26-22.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-26-22.png)

    1. At end of the contents of [Rprofile.site](http://rprofile.site) , add the following code and save it.

    ```bash
    .libPaths("C:/myRproject/Library")
    ```

    ![KakaoTalk_Photo_2021-09-06-21-32-33.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-32-33.png)

    1. At local disck (C:), create Directory "myRproejct" >> "Library" 

        ![KakaoTalk_Photo_2021-09-06-21-32-12.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-32-12.png)

        ![KakaoTalk_Photo_2021-09-06-21-37-41.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-37-41.png)

    1. Run Rstudio as administrator and type **.libPaths()** on console if you see the new path like picture below you are good to go. 

        ![KakaoTalk_Photo_2021-09-06-21-37-17.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-37-17.png)

    2. Download & Open the installation script from this link and Run it in Rstudio. (drag all line and click run to install)

        ![KakaoTalk_Photo_2021-09-06-21-41-50.png](Untitled%20750fc653088f431a83c81eecaec00812/KakaoTalk_Photo_2021-09-06-21-41-50.png)

    3. After you installation, Check if "knit Document" function works with an example code below (copy and paste on new R script sheet) and click "file" >> "Knit Document"

    ```bash
    #' Load package
    library(viridis)
    #' The code below deomostrates two color paletters in the [viridis](https://github.com/sjmgarier/viridis) package.
    #' Each plot displayes a contour map of the Mounga Wau volcano in Auckland, New Zealand.
    #' Viridis colors
    image(volcano, col = viridis(200))
    #' Magma colors
    image(volcano, col = viridis(200, option = "A")) 
    ```
