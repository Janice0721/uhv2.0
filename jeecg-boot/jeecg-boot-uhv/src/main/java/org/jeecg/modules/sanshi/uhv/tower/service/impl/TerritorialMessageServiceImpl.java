package org.jeecg.modules.sanshi.uhv.tower.service.impl;

import org.jeecg.modules.sanshi.uhv.tower.entity.TerritorialMessage;
import org.jeecg.modules.sanshi.uhv.tower.mapper.TerritorialMessageMapper;
import org.jeecg.modules.sanshi.uhv.tower.service.ITerritorialMessageService;
import org.springframework.stereotype.Service;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Description: 属地供电所填报
 * @Author: jeecg-boot
 * @Date:   2022-07-03
 * @Version: V1.0
 */
@Service
public class TerritorialMessageServiceImpl extends ServiceImpl<TerritorialMessageMapper, TerritorialMessage> implements ITerritorialMessageService {
	
	@Autowired
	private TerritorialMessageMapper territorialMessageMapper;
	
	@Override
	public List<TerritorialMessage> selectByMainId(String mainId) {
		return territorialMessageMapper.selectByMainId(mainId);
	}
}
