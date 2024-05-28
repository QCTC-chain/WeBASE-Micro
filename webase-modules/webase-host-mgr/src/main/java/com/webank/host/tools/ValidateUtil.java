package com.webank.host.tools;

import org.apache.commons.lang3.StringUtils;

/**
 * @author zhangyang
 * @version 1.0
 * @project WeBASE-Micro
 * @description
 * @date 2023/9/8 10:34:16
 */
public class ValidateUtil {
    public static final String IP_PATTERN =
        "^((0|1\\d?\\d?|2[0-4]?\\d?|25[0-5]?|[3-9]\\d?)\\.){3}(0|1\\d?\\d?|2[0-4]?\\d?|25[0-5]?|[3-9]\\d?)$";

    public static final String AGENCY_NAME_PATTERN = "^[0-9a-zA-Z_]+$";

    /**
     * Validate ipv4 address.
     *
     * @param ip
     * @return return false if ip is not a valid IP format.
     */
    public static boolean ipv4Valid(final String ip) {
        if (StringUtils.isBlank(ip)) {
            return false;
        }
        return ip.matches(IP_PATTERN);
    }

    public static boolean validateAgencyName(final String agencyName) {
        if (StringUtils.isBlank(agencyName)) {
            return false;
        }
        return agencyName.matches(AGENCY_NAME_PATTERN);
    }

    public static boolean validateUrl(String url) {
        if (StringUtils.isBlank(url)) {
            return false;
        }
        url = url.toLowerCase();
        String regex = "^((https|http|ftp|rtsp|mms)?://)" // https、http、ftp、rtsp、mms
            + "?(([0-9a-z_!~*‘().&=+$%-]+: )?[0-9a-z_!~*‘().&=+$%-]+@)?" // ftp的user@
            + "(([0-9]{1,3}\\.){3}[0-9]{1,3}" // IP形式的URL- 例如：199.194.52.184
            + "|" // 允许IP和DOMAIN（域名）
            + "([0-9a-z_!~*‘()-]+\\.)*" // 域名- www.
            + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\." // 二级域名
            + "[a-z]{2,6})" // first level domain- .com or .museum
            + "(:[0-9]{1,5})?" // 端口号最大为65535,5位数
            + "((/?)|" // a slash isn‘t required if there is no file name
            + "(/[0-9a-z_!~*‘().;?:@&=+$,%#-]+)+/?)$";
        return url.matches(regex);
    }
}
