package cn.mju.wjh.common.core.constant;

/**
 * ClassName: UseConstant
 * Package: cn.mju.wjh.common.core.constant
 * Description: 常用常量
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/11--16:22
 */
public class UseConstant {

    public static final String CONTENT_TYPE = "text/html;charset=UTF-8";

    public static final String LOGIN_CODE = "loginCode-";

    public static final String GBK = "GBK";

    public static final String EMAIL_PATTERN = "^(\\w+([-.][A-Za-z0-9]+)*){3,18}@\\w+([-.][A-Za-z0-9]+)*\\.\\w+([-.][A-Za-z0-9]+)*$";

    public static final String CURATION_CONSTANT = "(精选)";

    public static final String RELEASE_CONSTANT = "(发布)";

    public static final String ACCEPT_CONSTANT = "(采纳)";

    public static final String COLON_CONSTANT = ": ";

    public static final String ROD_CONSTANT = "-";

    public static final String LOGIN_ERROR_NUMBER = "loginErrorNumber" + COLON_CONSTANT;

    public static final String USER_CONSTANT = "user";

    public static final String ADMIN_CONSTANT = "login";

    public static final String ADMIN_REAL_CONSTANT = "admin";

    public static final String EMAIL_CODE_CONSTANT = " is emailCode" + COLON_CONSTANT;

    public static final Integer EMAIL_CODE_TIME = 5 * 60;

    public static final String LOGIN_DEVICE = "PC";

    public static final Long ROLE_SUPER_ADMIN_ID = (long) 1;

    public static final String ROLE_SUPER_ADMIN = "super-admin";

    public static final Long ROLE_ADMIN_ID = (long) 2;

    public static final Long ROLE_TEACHER_ID = (long) 3;

    public static final String ROLE_TEACHER = "teacher";

    public static final String TEACHER_CERTIFICATE = "certificate";

    public static final Long ROLE_USER_ID = (long) 4;

    public static final String ROLE_USER = "user";

    public static final String FIXED_PASSWORD = "123456";
}
