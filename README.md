## Diary

## 테이블 

### 사용자
CREATE TABLE TB_COMMU_USER (
   USER_ID VARCHAR(10) NOT NULL PRIMARY KEY,
   USER_PASSWORD VARCHAR(20) NOT NULL,
   USER_NAME VARCHAR(4) NOT NULL,
   USER_TEL VARCHAR(15) NOt NULL,
   USER_EMAIL VARCHAR(50) NOT NULL,
   USER_TYPE VARCHAR(5) NOT NULL,
   CREATE_DATE_TIME VARCHAR(14) NOT NULL,
   UPDATE_DATE_TIME VARCHAR(14) NOT NULL
);



### 작업순서

- 테이블(TB_DIARY) 생성
- diary/src/main/diary/domain/DiaryVo.java
- diary/src/main/resources/mappers/diaryMapper.xml
- diary/src/main/diary/persistence/DiaryDAO.java
- diary/src/main/diary/persistence/DiaryDAOImpl.java
- diary/src/main/diary/service/DiaryService.java
- diary/src/main/diary/service/DiaryServiceImpl.java
- diary/src/main/diary/controller/DiaryController.java
- diary/src/main/webapps/WEB-INF/views/diary/list.jsp
- diary/src/main/webapps/WEB-INF/views/diary/create.jsp
- diary/src/main/webapps/WEB-INF/views/diary/read.jsp
- diary/src/main/webapps/WEB-INF/views/diary/update.jsp
