package com.webank.common.core.exception.user;

/**
 * 验证码失效异常类
 *
 * @author webase
 */
public class CaptchaExpireException extends UserException {
    private static final long serialVersionUID = 1L;

    public CaptchaExpireException() {
        super("user.jcaptcha.expire");
    }
}
