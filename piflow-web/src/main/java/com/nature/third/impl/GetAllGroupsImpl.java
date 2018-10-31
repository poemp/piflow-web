package com.nature.third.impl;

import java.util.Date;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nature.base.util.HttpClientStop;
import com.nature.base.util.HttpUtils;
import com.nature.base.util.LoggerUtil;
import com.nature.base.util.Utils;
import com.nature.common.constant.SysParamsCache;
import com.nature.component.workFlow.model.StopGroup;
import com.nature.mapper.PropertyTemplateMapper;
import com.nature.mapper.StopGroupMapper;
import com.nature.mapper.StopsTemplateMapper;
import com.nature.third.inf.IGetAllGroups;

@Component
public class GetAllGroupsImpl implements IGetAllGroups {

	Logger logger = LoggerUtil.getLogger();
	
	@Autowired
	private StopGroupMapper stopGroupMapper;

	@Override
	public void getAllGroup() {
		String sendGetData = HttpUtils.doGet(SysParamsCache.STOP_GROUPS_URL(), null);
		logger.info("返回信息：" + sendGetData);
	}

	@Override
	public void getGroupAndSave() {
		//先清空Group表信息再插入
		int deleteGroup = stopGroupMapper.deleteGroup();
		System.out.println("成功删除Group"+deleteGroup+"条数据！！！");
		HttpClientStop stop = new HttpClientStop();
		String stopGroupInfo = stop.getGroupAndStopInfo("",SysParamsCache.STOP_GROUPS_URL());
		String jsonResult = "";
		if (StringUtils.isNotBlank(stopGroupInfo)) {
			jsonResult = JSONObject.fromObject(stopGroupInfo).getString("groups");
		}
		String[] group = jsonResult.split(",");
		int a = 0;
		for (String string : group) {
			if (string.length()>0) {
			StopGroup stopGroup = new StopGroup();
			stopGroup.setId(Utils.getUUID32());
			stopGroup.setCrtDttm(new Date());
			stopGroup.setCrtUser("Nature");
			stopGroup.setLastUpdateUser("Nature");
			stopGroup.setEnableFlag(true);
			stopGroup.setLastUpdateDttm(new Date());
			stopGroup.setVersion(0L);
			stopGroup.setGroupName(string);
			int insertStopGroup = stopGroupMapper.insertStopGroup(stopGroup);
			a+=insertStopGroup;
			}
		}
		System.out.println("成功插入Group"+a+"条数据！！！");
	}

}
