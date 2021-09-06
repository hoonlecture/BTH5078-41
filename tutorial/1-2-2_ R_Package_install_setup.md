# Packages installation for window

Note. R 3.6.2 or above version recommend an English language setting if you are using Korean as your display language change to English.

## **Change your language setting**

1. Go to the setting (설정) and click the account (계정)

    ![KakaoTalk_Photo_2021-09-06-20-46-36.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2ed13cdb-4309-4354-a3b0-65b6f13e9d3b/KakaoTalk_Photo_2021-09-06-20-46-36.png)

2. Check if the name of your user information is in English

    ![KakaoTalk_Photo_2021-09-06-20-46-31.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/87ebb555-1945-4a53-95ba-bd96c0d51b73/KakaoTalk_Photo_2021-09-06-20-46-31.png)

3. If the name of your user information is not in English then go to "family or other users"
(가족 및 다른 사용자) and add the new user **(!!!!Create your user name in English without space or dash!!!!)**

    ![KakaoTalk_Photo_2021-09-06-20-46-52 002.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6be11702-d53a-4a88-93ea-365449c895d3/KakaoTalk_Photo_2021-09-06-20-46-52_002.png)

4. Go to time and language (시간 및 언어) menu and add English if you don't have English as displaying language.

    ![KakaoTalk_Photo_2021-09-06-20-46-52 003.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a281c114-802c-4541-8d7b-f0063eae092a/KakaoTalk_Photo_2021-09-06-20-46-52_003.png)

    ![KakaoTalk_Photo_2021-09-06-20-46-52 006.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d7e632f5-17a0-474e-b4b4-63b8a6519923/KakaoTalk_Photo_2021-09-06-20-46-52_006.png)

    ![KakaoTalk_Photo_2021-09-06-20-46-52 004.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6475c529-3387-48a7-9796-4d4c01328ade/KakaoTalk_Photo_2021-09-06-20-46-52_004.png)

    ![KakaoTalk_Photo_2021-09-06-20-46-52 005.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ce75bae5-99de-472f-9e77-6cd1bca7d757/KakaoTalk_Photo_2021-09-06-20-46-52_005.png)

    ![KakaoTalk_Photo_2021-09-06-20-46-51 001.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4d7a5eca-48ff-401e-858c-3d5885cd6f35/KakaoTalk_Photo_2021-09-06-20-46-51_001.png)

5. Search for Rtools3.5 

    ![KakaoTalk_Photo_2021-09-06-21-00-08 001.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9f87ed75-d2bc-4fa5-bbac-6263374bfce6/KakaoTalk_Photo_2021-09-06-21-00-08_001.png)

    ![KakaoTalk_Photo_2021-09-06-21-00-08 002.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fe77c3d8-db35-4812-bccd-5c0666d20911/KakaoTalk_Photo_2021-09-06-21-00-08_002.png)

    ![KakaoTalk_Photo_2021-09-06-21-00-08 003.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b1025c95-1a7c-4893-b151-5ed099ab21db/KakaoTalk_Photo_2021-09-06-21-00-08_003.png)

6. Install Rtools35

(next>>next>> next>>check add rtools to system path >> next >> install >> finish)

![KakaoTalk_Photo_2021-09-06-21-00-08 004.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e7b9e05b-cb29-49be-89e3-fc74e2159a06/KakaoTalk_Photo_2021-09-06-21-00-08_004.png)

![KakaoTalk_Photo_2021-09-06-21-00-08 005.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f9d3cce7-8883-4aa4-85c7-1ff20b5c1c37/KakaoTalk_Photo_2021-09-06-21-00-08_005.png)

![KakaoTalk_Photo_2021-09-06-21-00-08 006.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/13fbf51f-963b-4ca2-8a0f-9f0697f10ea6/KakaoTalk_Photo_2021-09-06-21-00-08_006.png)

![KakaoTalk_Photo_2021-09-06-21-00-08 007.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e5a4e5a2-7585-4c0e-b522-6252440b28b4/KakaoTalk_Photo_2021-09-06-21-00-08_007.png)

1. Run Rstudio as administrator (관리자 권한으로 Rstudio를 실행하세요~!!)
2. Type following code on the R console window

```bash
writeLines('PATH="${RTOOLS_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
```

```bash
> Sys.which("make")
"C:\\Rtools\\bin\\make.exe" ### if you see this you succeed
```

![KakaoTalk_Photo_2021-09-06-21-07-20.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3b5e8a4d-f9df-41d3-9bd3-41ba89c06185/KakaoTalk_Photo_2021-09-06-21-07-20.png)

1. Then, we will add the .libPaths() where packages will be installed. **Go to This PC >> Local disk (C:) >> Program Files >> R >> R 3.6.2 >> etc >> find Rprofile.site**

    ![KakaoTalk_Photo_2021-09-06-21-16-02.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6ebbc3b7-4585-44f2-abad-cb50b5b14767/KakaoTalk_Photo_2021-09-06-21-16-02.png)

2. Right click the [Rprofile.site](http://rprofile.site) and click the Properties (속성). 
3. Go to Security menu and Click the "USERS" and Click "Edit" 

    ![KakaoTalk_Photo_2021-09-06-21-26-14.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/69a727a8-68bf-4564-a166-66cafa568079/KakaoTalk_Photo_2021-09-06-21-26-14.png)

4. Click User and Check the "Full control" box and apply & okay. 

    ![KakaoTalk_Photo_2021-09-06-21-26-19.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7b96ffc5-372b-4505-aa47-77f6b13cb93a/KakaoTalk_Photo_2021-09-06-21-26-19.png)

5. Right click the [Rprofile.site](http://rprofile.site) and "Open with" NotePad (메모장)

    ![KakaoTalk_Photo_2021-09-06-21-26-22.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cc6a2ab0-40e7-4b67-9d3c-4d3b29a83395/KakaoTalk_Photo_2021-09-06-21-26-22.png)

    1. At end of the contents of [Rprofile.site](http://rprofile.site) , add the following code and save it.

    ```bash
    .libPaths("C:/myRproject/Library")
    ```

    ![KakaoTalk_Photo_2021-09-06-21-32-33.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ac37916a-d531-40f7-99a0-2082d19b94a0/KakaoTalk_Photo_2021-09-06-21-32-33.png)

    1. At local disck (C:), create Directory "myRproejct" >> "Library" 

        ![KakaoTalk_Photo_2021-09-06-21-32-12.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c0002905-0ed1-497c-b81a-72106f640223/KakaoTalk_Photo_2021-09-06-21-32-12.png)

        ![KakaoTalk_Photo_2021-09-06-21-37-41.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/98bfd52f-e908-4478-88c6-a7e9fe4ab6f0/KakaoTalk_Photo_2021-09-06-21-37-41.png)

    1. Run Rstudio as administrator and type **.libPaths()** on console if you see the new path like picture below you are good to go. 

        ![KakaoTalk_Photo_2021-09-06-21-37-17.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7e247c85-480e-4b66-8d19-889e8cc360d4/KakaoTalk_Photo_2021-09-06-21-37-17.png)

    2. Download & Open the installation script from this link and Run it in Rstudio. (drag all line and click run to install)

        ![KakaoTalk_Photo_2021-09-06-21-41-50.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/057a6908-5646-435d-8883-ed8edf29951e/KakaoTalk_Photo_2021-09-06-21-41-50.png)

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
