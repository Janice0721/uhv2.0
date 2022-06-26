package org.jeecg.modules.sanshi.uhv.tower.service;

import org.jeecg.modules.sanshi.uhv.tower.entity.ConstructionMessage;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;

/**
 * @Description: 施工填报
 * @Author: jeecg-boot
 * @Date:   2022-06-26
 * @Version: V1.0
 */
public interface IConstructionMessageService extends IService<ConstructionMessage> {

	public List<ConstructionMessage> selectByMainId(String mainId);
}
