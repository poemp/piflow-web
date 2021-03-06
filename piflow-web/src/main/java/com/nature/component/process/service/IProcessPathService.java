package com.nature.component.process.service;

import com.nature.component.process.vo.ProcessPathVo;

public interface IProcessPathService {

    /**
     * Query processPath based on processId and pageId
     *
     * @param processId
     * @param pageId
     * @return
     */
    public ProcessPathVo getProcessPathVoByPageId(String processId, String pageId);

    /**
     * Query processGroupPath based on processId and pageId
     *
     * @param processGroupId
     * @param pageId
     * @return
     */
    public ProcessPathVo getProcessGroupPathVoByPageId(String processGroupId, String pageId);
}
