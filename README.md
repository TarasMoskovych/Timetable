## Timetable
### Overview:
This is automated workload distribution system for teachers and students based on MVC client-server architecture. 
+ The server part of the system was implemented through Spring technology. 
+ The client part of the system was implemented through Bootstrap technology.
### Instructions to use:
+ Hibernate properties to deploy the app:
```ruby <property name="hibernate.connection.driver_class" value="com.mysql.jdbc.Driver"/>
<property name="hibernate.connection.url" value="jdbc:mysql://localhost/timetableDB?createDatabaseIfNotExist=true"/>
<property name="hibernate.connection.username" value="root"/>
<property name="hibernate.connection.password" value="123456"/>
<property name="hibernate.dialect" value="org.hibernate.dialect.MySQLDialect"/>
<property name="hibernate.hbm2ddl.auto" value="update"/>
```
+ Searching page:

![searching page](https://user-images.githubusercontent.com/25983805/31905036-87e7f76c-b835-11e7-850a-41282137c393.png)

+ Lessons for group:

![lessons](https://user-images.githubusercontent.com/25983805/31905033-874a7438-b835-11e7-9cac-d5475d5de0b4.png)

+ Exams for teacher:

![exams](https://user-images.githubusercontent.com/25983805/31905027-864a9a5e-b835-11e7-87bd-dbc7a3545cb9.png)

+ Login page for admin: 
```ruby  
<security:user name="admin" password="admin" authorities="ROLE_ADMIN"/>
```
![login](https://user-images.githubusercontent.com/25983805/31905035-87af7360-b835-11e7-9c8f-a0f15a56b5dd.png)

+ After loginning you have able to go to admin page. 

![logged](https://user-images.githubusercontent.com/25983805/31905034-87793318-b835-11e7-95ae-0195db23f26f.png)

+ Admin panel. In  submenu Data management admin can add, edit or delete group, classroom, subject or teacher. In submenu Subject you have to add teachers to current subject.

![subjects](https://user-images.githubusercontent.com/25983805/31905037-88107f0c-b835-11e7-8021-2fad739872dd.png)

+ Then you have to add new curriculum that includes subjects hours, then choose groups for it:

![curriculums](https://user-images.githubusercontent.com/25983805/31905026-86194b70-b835-11e7-8336-89ac41e6cbbb.png)

+ Generating lessons:

![generate lessons](https://user-images.githubusercontent.com/25983805/31905030-86b5741e-b835-11e7-9bca-c418e2f2be6a.png)

+ Result:

![generated lessons](https://user-images.githubusercontent.com/25983805/31905032-87196dac-b835-11e7-8df4-370fe8d60b90.png)

+ Generating exams:

![generate exams](https://user-images.githubusercontent.com/25983805/31905029-8683720c-b835-11e7-9ae2-d4a49048bc44.png)

+ Result:

![generated exams](https://user-images.githubusercontent.com/25983805/31905031-86ea11ba-b835-11e7-91d0-d108474a6c32.png)

+ Adding new exam manually:

![add exam](https://user-images.githubusercontent.com/25983805/31905023-859bf92c-b835-11e7-9ec8-525688184d43.png)

+ Result:

![added exam](https://user-images.githubusercontent.com/25983805/31905024-85e53452-b835-11e7-9612-28ed82891107.png)
