package com.webank.common.translation.core.impl;

import com.webank.common.translation.annotation.TranslationType;
import com.webank.common.translation.constant.TransConstant;
import com.webank.common.translation.core.TranslationInterface;
import com.webank.system.api.RemoteUserService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;

/**
 * 用户名翻译实现
 *
 * @author QCTC
 */
@AllArgsConstructor
@TranslationType(type = TransConstant.USER_ID_TO_NAME)
public class UserNameTranslationImpl implements TranslationInterface<String> {

    @DubboReference
    private RemoteUserService remoteUserService;

    @Override
    public String translation(Object key, String other) {
        return remoteUserService.selectUserNameById((Long) key);
    }
}
