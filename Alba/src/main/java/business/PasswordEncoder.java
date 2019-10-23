package business;

public interface PasswordEncoder {
    String encode(CharSequence var1);
    // 패스워드를 암호화 할 때 사용

    boolean matches(CharSequence var1, String var2);
    // 사용자에게 입력받은 패스워드를 비교할 때 사용
    // 앞에는 raw password, 뒤에는 encoded password

    default boolean upgradeEncoding(String encodedPassword) {
        return false;
    } // upgradeEncoding
    // default 메소드는 커스텀해서 더 강력한 암호화를 실행할 때 사용

} //PasswordEncoder 