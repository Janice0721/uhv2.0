package org.jeecg.modules.sanshi.uhv.tower.mapper;

import java.util.List;
import org.jeecg.modules.sanshi.uhv.tower.entity.TerritorialMessage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * @Description: 属地供电所填报
 * @Author: jeecg-boot
 * @Date:   2022-06-26
 * @Version: V1.0
 */
public interface TerritorialMessageMapper extends BaseMapper<TerritorialMessage> {

	public boolean deleteByMainId(@Param("mainId") String mainId);
    
	public List<TerritorialMessage> selectByMainId(@Param("mainId") String mainId);

}
