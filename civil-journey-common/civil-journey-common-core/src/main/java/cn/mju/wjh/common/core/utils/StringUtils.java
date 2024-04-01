package cn.mju.wjh.common.core.utils;


/**
 * ClassName: StringUtils
 * Package: cn.mju.wjh.common.core.utils
 * Description: 字符串工具类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--13:37
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils
{
    /** 空字符串 */
    private static final String NULLSTR = "";

    /** 下划线 */
    private static final char SEPARATOR = '_';


    /**
     * * 判断一个字符串是否为空串
     * @param str String
     * @return true：为空 false：非空
     */
    public static boolean isEmpty(String str) {
        return isNull(str) || NULLSTR.equals(str.trim());
    }


    /**
     * 判断一个对象是否为空
     * @param object Object
     * @return true：为空 false：非空
     */
    public static boolean isNull(Object object) {
        return object == null;
    }

    /**
     * 去空格
     */
    public static String trim(String str) {
        return (str == null ? "" : str.trim());
    }

}