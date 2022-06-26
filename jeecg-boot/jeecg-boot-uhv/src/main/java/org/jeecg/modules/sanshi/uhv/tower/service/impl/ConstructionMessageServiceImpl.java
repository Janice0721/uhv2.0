package org.jeecg.modules.sanshi.uhv.tower.service.impl;

import org.jeecg.modules.sanshi.uhv.tower.entity.ConstructionMessage;
import org.jeecg.modules.sanshi.uhv.tower.mapper.ConstructionMessageMapper;
import org.jeecg.modules.sanshi.uhv.tower.service.IConstructionMessageService;
import org.springframework.stereotype.Service;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Description: 施工填报
 * @Author: jeecg-boot
 * @Date:   2022-06-26
 * @Version: V1.0
 */
@Service
public class ConstructionMessageServiceImpl extends ServiceImpl<ConstructionMessageMapper, ConstructionMessage> implements IConstructionMessageService {
	
	@Autowired
	private ConstructionMessageMapper constructionMessageMapper;
	
	@Override
	public List<ConstructionMessage> selectByMainId(String mainId) {
		return constructionMessageMapper.selectByMainId(mainId);
	}
}
