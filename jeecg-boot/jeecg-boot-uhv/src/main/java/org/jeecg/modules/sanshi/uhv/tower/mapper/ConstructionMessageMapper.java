package org.jeecg.modules.sanshi.uhv.tower.mapper;

import java.util.List;
import org.jeecg.modules.sanshi.uhv.tower.entity.ConstructionMessage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * @Description: 施工填报
 * @Author: jeecg-boot
 * @Date:   2022-06-26
 * @Version: V1.0
 */
public interface ConstructionMessageMapper extends BaseMapper<ConstructionMessage> {

	public boolean deleteByMainId(@Param("mainId") String mainId);
    
	public List<ConstructionMessage> selectByMainId(@Param("mainId") String mainId);

}
