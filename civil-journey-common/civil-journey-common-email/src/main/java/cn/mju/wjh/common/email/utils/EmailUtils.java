package cn.mju.wjh.common.email.utils;

import cn.mju.wjh.common.email.exception.SendEmailException;
import cn.mju.wjh.common.email.exception.SenderNicknameException;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;

/**
 * ClassName: EmailUtils
 * Package: cn.mju.wjh.email.utils
 * Description: 邮箱工具类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--21:23
 */
@Component
public class EmailUtils {

    @Setter(onMethod_ = @Autowired)
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String sender;

    @Value("${spring.mail.nickname}")
    private String nickname;

    public Boolean sendEmail(String email, String message) throws MessagingException {
        // 创建邮箱信息类
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true);
        // 发送者
        try {
            messageHelper.setFrom(new InternetAddress(sender, nickname));
        } catch (UnsupportedEncodingException e) {
            throw new SenderNicknameException(e.getMessage());
        }
        // 接收者
        messageHelper.setTo(email);
        // 邮件主题
        messageHelper.setSubject("公途平台");
        // 邮件内容
        messageHelper.setText(message);
        // 发送操作
        try {
            mailSender.send(mimeMessage);
            return true;
        } catch (MailException e) {
            throw new SendEmailException("邮件发送异常");
        }
    }

    /**
     * 根据邮箱获取验证码
     * @param email 邮箱
     * @return 验证码
     */
    public Boolean sendEmailGetCode(String email,String emailCode) throws MessagingException {
        // 创建邮箱信息类
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true);
        // 发送者
        try {
            messageHelper.setFrom(new InternetAddress(sender, nickname));
        } catch (UnsupportedEncodingException e) {
            throw new SenderNicknameException(e.getMessage());
        }
        // 接收者
        messageHelper.setTo(email);
        // 邮件主题
        messageHelper.setSubject("公途平台--验证码");
        // 邮件内容( true:开启html文件发送 )
        messageHelper.setText(getSendText(emailCode),true);
        // 发送操作
        try {
            mailSender.send(message);
            return true;
        } catch (MailException e) {
            throw new SendEmailException("邮件发送异常");
        }
    }

    /**
     * 自定义邮件内容(发送验证码模板)
     * @param emailCode 验证码
     * @return 邮件内容
     */
    private static String getSendText(String emailCode) {
        return """
                <h3>尊敬的用户,您好！</h3>
                <p style="font-family: 'lucida Grande',Verdana,'Microsoft YaHei'; margin: 10px 0; font-size: 16px; line-height: 2; ">您的验证码（有效期5分钟）：
                <span style="font-family: 'lucida Grande',Verdana,'Microsoft YaHei';  font-size: 20px; color: white; display: inline-flex ; background-color: gold; height: 3.5rem; width: 7rem; justify-content: center; align-items: center; ">
                """
                +
                emailCode
                +
                """
                </span></p>
                <p style="color: red;">如果您遇到任何问题,请随时联系我们的客服人员。</p>
                <p>祝您使用愉快！</p>
                <p>公途团队</p>
                """;
    }



}
