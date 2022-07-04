package org.jeecg.modules.sanshi.uhv.tower.service;

import org.jeecg.modules.sanshi.uhv.tower.entity.TerritorialMessage;
import org.jeecg.modules.sanshi.uhv.tower.entity.ConstructionMessage;
import org.jeecg.modules.sanshi.uhv.tower.entity.Tower;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * @Description: 塔杆信息
 * @Author: jeecg-boot
 * @Date:   2022-07-03
 * @Version: V1.0
 */
public interface ITowerService extends IService<Tower> {

	/**
	 * 删除一对多
	 */
	public void delMain (String id);
	
	/**
	 * 批量删除一对多
	 */
	public void delBatchMain (Collection<? extends Serializable> idList);


}
