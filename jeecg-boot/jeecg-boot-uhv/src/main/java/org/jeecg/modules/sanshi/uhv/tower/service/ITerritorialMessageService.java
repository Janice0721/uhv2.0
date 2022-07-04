package org.jeecg.modules.sanshi.uhv.tower.service;

import org.jeecg.modules.sanshi.uhv.tower.entity.TerritorialMessage;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;

/**
 * @Description: 属地供电所填报
 * @Author: jeecg-boot
 * @Date:   2022-07-03
 * @Version: V1.0
 */
public interface ITerritorialMessageService extends IService<TerritorialMessage> {

	public List<TerritorialMessage> selectByMainId(String mainId);
}
