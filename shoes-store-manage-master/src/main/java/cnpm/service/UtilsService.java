package cnpm.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UtilsService {
	@Autowired
	ServletContext context;
	
	@Autowired
	JavaMailSender mailSender;
	
	public String luuFile(MultipartFile file) {
		if(file.isEmpty()) {
			return null;
		}
		try{
			System.out.println("sys "+System.currentTimeMillis());

			String path = System.currentTimeMillis() + file.getOriginalFilename();
			String filePath = context.getRealPath("/resources/file/" +  path);
			file.transferTo(new File(filePath));
			
			
			System.out.println("file " + path);
			System.out.println("file new" + file.getOriginalFilename());
			
			/*
			 * model.addAttribute("file_name", file.getOriginalFilename());
			 * model.addAttribute("cv_name", cv.getOriginalFilename());
			 * model.addAttribute("cv_type", cv.getContentType());
			 * model.addAttribute("cv_size", cv.getSize());
			 */
			
			Thread.sleep(5000);
//			return file.getOriginalFilename();
			return path;
			
		}
		catch(Exception e){
			System.out.println(e.getCause());
			
		}
		return null;
	}
	
	public Boolean guiEmail(String email, String noiDung, int kieu) {
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		try {
			helper.setFrom("no-reply-email");
			helper.setTo(email);
			if(kieu == 1) {
				helper.setSubject("Tình trạng đơn hàng!");
				helper.setText("Đơn hàng của quý khách " + noiDung + " Xin cảm ơn và hẹn gặp lại quý khách!");
			}
			else if(kieu == 2) {
				helper.setSubject("Thanh toán thành công!");
				helper.setText("Đơn hàng của quý khách đã thanh toán online thành công. Xin cảm ơn và hẹn gặp lại quý khách!");
			}
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mailSender.send(message);
		return true;
	}
}
