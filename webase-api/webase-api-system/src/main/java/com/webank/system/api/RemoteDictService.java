package com.webank.system.api;

import com.webank.system.api.domain.SysDictData;

import java.util.List;

/**
 * 字典服务
 *
 * @author QCTC
 */
public interface RemoteDictService {

    /**
     * 根据字典类型查询字典数据
     *
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    List<SysDictData> selectDictDataByType(String dictType);
}
