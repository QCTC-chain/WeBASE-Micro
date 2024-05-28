package com.webank.resource.api;

import com.webank.common.core.exception.ServiceException;
import com.webank.resource.api.domain.SysFile;

/**
 * 文件服务
 *
 * @author QCTC
 */
public interface RemoteFileService {

    /**
     * 上传文件
     *
     * @param file 文件信息
     * @return 结果
     */
    SysFile upload(String name, String originalFilename, String contentType, byte[] file) throws ServiceException;

    /**
     * 通过ossId查询对应的url
     *
     * @param ossIds ossId串逗号分隔
     * @return url串逗号分隔
     */
    String selectUrlByIds(String ossIds);

}
