package com.webank.common.translation.core.impl;

import com.webank.common.translation.annotation.TranslationType;
import com.webank.common.translation.constant.TransConstant;
import com.webank.common.translation.core.TranslationInterface;
import com.webank.resource.api.RemoteFileService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;

/**
 * OSS翻译实现
 *
 * @author QCTC
 */
@AllArgsConstructor
@TranslationType(type = TransConstant.OSS_ID_TO_URL)
public class OssUrlTranslationImpl implements TranslationInterface<String> {

    @DubboReference
    private RemoteFileService ossService;

    @Override
    public String translation(Object key, String other) {
        return ossService.selectUrlByIds(key.toString());
    }
}
