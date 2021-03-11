# helloSpringMVC

Spring MVC framework, Spring Web Form, Spring Security 실습 프로젝트

🔍 **Spring MVC**

- 웹 애플리케이션 개발을 위한 **model-view-controller 아키텍처 제공**
  - **model**: 애플리케이션 데이터를 캡슐화하고 일반적으로 POJO로 구성됨
  - **view**: 모델 데이터를 렌더링하고 일반적으로 HTML 출력을 생성
  - **controller**: 사용자 요청을 처리하고 적절한 모델을 구축하여 뷰에 전달
  
- MVC 구조가 동작하기 위해 필요한 환경 제공
  - Dispatcher Servlet, Handler Mapping, View Resolver, etc
  
- Recuired Configuration
  - maven configuration: pom.xml(**spring-webmvc**)
  - web deployment descriptor: web.xml(**ContextLoaderListener, DispatcherServlet**)
  - spring mvc configuration: **root-context.xml, servlet-context.xml, dao-context.xml, service-context.xml**


🔍 **Spring Web Form**

- **Data Binding**
  - **request parameters**를 "**form bean**"에 **바인딩**하는 과정
  - form에서 가져온 데이터를 객체에 자동으로 바인딩
  - 새로운 form bean 생성 > request parameters로 채움 > model에 추가됨

- **Data Validation**
  - 사용자가 실수로 잘못된 정보를 입력할 경우 오류를 설명하여 사용자가 오류를 극복할 수 있도록 도움
  - form bean의 유효성 확인: **Hibernate Validator** 사용
  - 위반된 제약 조건에 대한 오류 메시지 생성: 각 속성에 대해 **message descriptor** 정의
  - validating object > **@Valid**, result of the valiation > **BindingResult**: BindingResult 객체를 검사하여 오류 확인

- **Data Buffering**
  - 사용자가 web form을 re-type하지 않도록 기존에 입력한 내용을 채워서 보여주는 것
  - **Spring form tag librar**y 사용
  - ex. <sf:form modelAttribute="offer">, <sf:errors path="name"/>

🔍 **Spring Security**

- **Authentication**: 로그인을 통해 인증 절차를 밟음
- **Authorization**: 인증 받은 사용자의 권한 검사
- Spring은 데이터베이스에 저장된 사용자 정보를 바탕으로 login 기능 수행

📄 **Summary**

- **Spring MVC framework**를 사용하여 애플리케이션을 만들고 **Spring Web Form**과 **Spring Security**기능을 추가하여 인증 받은 사용자로부터 새로운 제안을 입력 받는 페이지를 구성함

✏️ **Example Description**

<img src="https://user-images.githubusercontent.com/56067179/110733685-b84a8300-8269-11eb-8cfc-d31cfa0a74bd.png" width="200"/>

- **model**: offer
- **view**: home, offers, login, createOffer, offerCreated
- **controller**: home, login, offer
- service: offerService
- dao: offerDao
- configuration
  - spring: servlet-context.xml, service-context.xml, dao-context.xml, security-context.xml
  - web deployment descriptor: web.xml
  - maven: pom.xml
- **database**
  - offers
  - users: name, password, enabled 저장
  - authorities: name, authority(ROLE_USER, ROLE_ADMIN) 저장
- **login, logout**: custom login form, login과 logout 절차는 spring에서 수행

✔️ **Run**

- **home > show current offers**

offers 조회

<img src="https://user-images.githubusercontent.com/56067179/110725539-1d4aac80-825b-11eb-8009-8fb5706e8e80.PNG" width="500"/> <img src="https://user-images.githubusercontent.com/56067179/110725550-2471ba80-825b-11eb-888f-ad61a9af2ab1.PNG" width="500"/>


- **home > add a new offer**

잘못된 password 입력 👉 error message 출력

<img src="https://user-images.githubusercontent.com/56067179/110725598-33586d00-825b-11eb-8637-ac26cf90edb7.PNG" width="500"/> <img src="https://user-images.githubusercontent.com/56067179/110725602-35223080-825b-11eb-9637-136639b2f943.PNG" width="500"/>

맞는 password 입력, ROLE_USER 👉 createOffer 페이지로 이동

<img src="https://user-images.githubusercontent.com/56067179/110725609-39e6e480-825b-11eb-8a11-8f002b847378.PNG" width="500"/> <img src="https://user-images.githubusercontent.com/56067179/110725569-2a679b80-825b-11eb-8500-565601d150e2.PNG" width="500"/>


- **createOffer**

error message examples

<img src="https://user-images.githubusercontent.com/56067179/110726554-ee353a80-825c-11eb-84f4-fc2e0f6b4670.PNG" width="500"/> <img src="https://user-images.githubusercontent.com/56067179/110726586-fc835680-825c-11eb-98da-4b20a47d8e1b.PNG" width="500"/>


- **fill up a web form > doCreate**

<img src="https://user-images.githubusercontent.com/56067179/110726565-f42b1b80-825c-11eb-873d-a7ca2a77807a.PNG" width="500"/> <img src="https://user-images.githubusercontent.com/56067179/110725647-48350080-825b-11eb-89f2-fbb694b95620.PNG" width="500"/>


- **offers 조회**

새로운 제안이 추가됨

<img src="https://user-images.githubusercontent.com/56067179/110725651-49662d80-825b-11eb-9038-7bbd0b6d0fca.PNG" width="500"/>


- **logout**

logout success message 출력

<img src="https://user-images.githubusercontent.com/56067179/110725663-4d924b00-825b-11eb-947e-59a4d0174e62.PNG" width="500"/> <img src="https://user-images.githubusercontent.com/56067179/110725667-4ec37800-825b-11eb-8bb4-ba157bb33553.PNG" width="500"/>


