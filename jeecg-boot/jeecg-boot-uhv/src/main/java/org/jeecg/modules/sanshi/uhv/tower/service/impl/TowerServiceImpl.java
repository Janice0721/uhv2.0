package org.jeecg.modules.sanshi.uhv.tower.service.impl;

import org.jeecg.modules.sanshi.uhv.tower.entity.Tower;
import org.jeecg.modules.sanshi.uhv.tower.entity.TerritorialMessage;
import org.jeecg.modules.sanshi.uhv.tower.entity.ConstructionMessage;
import org.jeecg.modules.sanshi.uhv.tower.mapper.TerritorialMessageMapper;
import org.jeecg.modules.sanshi.uhv.tower.mapper.ConstructionMessageMapper;
import org.jeecg.modules.sanshi.uhv.tower.mapper.TowerMapper;
import org.jeecg.modules.sanshi.uhv.tower.service.ITowerService;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import java.io.Serializable;
import java.util.List;
import java.util.Collection;

/**
 * @Description: 塔杆信息
 * @Author: jeecg-boot
 * @Date:   2022-06-26
 * @Version: V1.0
 */
@Service
public class TowerServiceImpl extends ServiceImpl<TowerMapper, Tower> implements ITowerService {

	@Autowired
	private TowerMapper towerMapper;
	@Autowired
	private TerritorialMessageMapper territorialMessageMapper;
	@Autowired
	private ConstructionMessageMapper constructionMessageMapper;
	
	@Override
	@Transactional
	public void delMain(String id) {
		territorialMessageMapper.deleteByMainId(id);
		constructionMessageMapper.deleteByMainId(id);
		towerMapper.deleteById(id);
	}

	@Override
	@Transactional
	public void delBatchMain(Collection<? extends Serializable> idList) {
		for(Serializable id:idList) {
			territorialMessageMapper.deleteByMainId(id.toString());
			constructionMessageMapper.deleteByMainId(id.toString());
			towerMapper.deleteById(id);
		}
	}
	
}
