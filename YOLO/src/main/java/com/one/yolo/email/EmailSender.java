package com.one.yolo.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {

	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(String subject, String content, 
		String receiver, String sender) throws MessagingException{
		//이메일 발송하기
		
		MimeMessage message =mailSender.createMimeMessage();
		message.setSubject(subject);  //제목
		message.setText(content); //내용
		message.setRecipient(RecipientType.TO, 
				new InternetAddress(receiver));  //받는 사람
		message.setFrom(new InternetAddress(sender)); //보내는 사람
		
		mailSender.send(message);
		
	}
	
}










