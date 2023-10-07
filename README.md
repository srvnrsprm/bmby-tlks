                                      Bombay Talkies
This is a website designed for an imaginary theatre located in an imaginary town. 

Thetre home page:
![Home page](/scrnshts/bmbyTlksHmPg.jpg)
![Screened movies](/scrnshts/bmbyTlksScrnMovies.jpg)
![Contact Us](/scrnshts/bmbyTlksCntctUs.jpg)

Languages/Frameworks used:
==========================
  * Java ( Java-XML bindings, JSP )
  * Apache Tomcat server

Configurations:
===============
  * For `contact us` support, one needs to configure their WEB-INF/web.xml with email username & password settings:
```
	<web-app>
	<context-param>
		<param-name>FROM_EMAIL_ID</param-name>
		<param-value>LOGIN_ID</param-value>
	</context-param>
	<context-param>
		<param-name>PSSWRD</param-name>
		<param-value>LOGIN_PASSWORD</param-value>
	</context-param>
	<context-param>
		<param-name>TO_EMAIL_ID</param-name>
		<param-value>DSTNATION_ID</param-value>
	</context-param>
	<context-param>
		<param-name>SMTP_HOST</param-name>
		<param-value>SMTP_HOST_ADDRSS</param-value>
	</context-param>
</web-app>
```
	* In the above web.xml template, change the parameters `LOGIN_ID, LOGIN_PASSWORD, DSTNATION_ID, SMTP_HOST_ADDRESS` to match your local settings.
