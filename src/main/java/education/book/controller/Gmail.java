package education.book.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("seojw0730@gmail.com", "bwrw bzec mqet ajct");
//		return new PasswordAuthentication("구글 이메일", "앱 비밀번호");
	}
}
