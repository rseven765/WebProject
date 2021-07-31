package jeongps;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MyLibrary {
    
    /*
     * 문자열 암호화 처리
     * @param String str 암호화 처리할 문자열
     * @return String enc 암호화된 문자열
    */
    public static String encString(String str) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String enc = bCryptPasswordEncoder.encode(str);
        return enc;
    }

    /*
     * 현재년월일시분초를 조회
     * @param 없음
     * @return String dateTime 현재년월일시분초
     */
    public static String dateTime() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
        Date currentTime = new Date();
        String dateTime = formatter.format(currentTime);
        return dateTime;
    }
}
