package sk;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.*;
import javax.activation.*;

@WebServlet( urlPatterns={"/api/sndMl"} )
public class MailSrvlt extends HttpServlet {
		public void init(ServletConfig config) throws ServletException {
				super.init(config);
    }

		public void doPost( HttpServletRequest rqst, HttpServletResponse rspns ) {
				try {
						/* Reading the post body, parsing the keys, loading it into a hash map */
						HashMap<String, String> hm = new HashMap<String, String>();
						StringBuffer sb = new StringBuffer();
						String line = null;
						BufferedReader br = rqst.getReader();
						while( (line=br.readLine()) != null ) sb.append( line );
						String bdy = java.net.URLDecoder.decode( sb.toString(), java.nio.charset.StandardCharsets.UTF_8.toString());
						String prts[] = bdy.split( "&" );
						for( String prt: prts ) {
								String pairs[] = prt.split( "=" );
								hm.put( pairs[0], pairs[1] );
						}
						
						String to = getServletContext().getInitParameter( "TO_EMAIL_ID" );
						Properties properties = System.getProperties();
						properties.setProperty( "mail.transport.protocol", "smtp" );
						properties.setProperty("mail.smtp.host", getServletContext().getInitParameter( "SMTP_HOST" ) );
						properties.setProperty( "mail.smtp.port", "25" ); //check ports 25, 465, 587
						properties.setProperty( "mail.smtp.ssl.protocols", "TLSv1.2" ); //check ports 25, 465, 587
						properties.setProperty( "mail.smtp.starttls.enable", "true" );
						//properties.setProperty( "mail.smtp.ssl.enable", "true" );
						properties.setProperty( "mail.smtp.auth", "true" );
						Session session = Session.getInstance(properties, new Authenticator() {
										public PasswordAuthentication getPasswordAuthentication() {
												return new PasswordAuthentication( getServletContext().getInitParameter( "FROM_EMAIL_ID" ),
																													 getServletContext().getInitParameter( "PSSWRD" ) );
										}
								});
						MimeMessage message = new MimeMessage(session);
						message.setFrom(new InternetAddress( getServletContext().getInitParameter( "FROM_EMAIL_ID" ) ));
						message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
						message.setSubject( hm.get( "subject" ) );
						message.setText( "Mail sent by " + hm.get( "email" ) + "\n" + hm.get( "message" ) );
						Transport.send(message);
						System.out.println("1sk1 message sent successfully....");
				} catch( Exception e ) {
						e.printStackTrace();
				}
		}
}
