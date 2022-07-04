package org.jeecg.modules.sanshi.uhv.tower.entity;

import java.io.Serializable;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.jeecg.common.aspect.annotation.Dict;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.jeecgframework.poi.excel.annotation.Excel;
import java.util.Date;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.UnsupportedEncodingException;

/**
 * @Description: 施工填报
 * @Author: jeecg-boot
 * @Date:   2022-07-03
 * @Version: V1.0
 */
@Data
@TableName("construction_message")
@ApiModel(value="construction_message对象", description="施工填报")
public class ConstructionMessage implements Serializable {
    private static final long serialVersionUID = 1L;

	/**id*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "id")
    private java.lang.String id;
	/**创建人*/
    @ApiModelProperty(value = "创建人")
    private java.lang.String createBy;
	/**创建日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "创建日期")
    private java.util.Date createTime;
	/**更新人*/
    @ApiModelProperty(value = "更新人")
    private java.lang.String updateBy;
	/**更新日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "更新日期")
    private java.util.Date updateTime;
	/**所属部门*/
    @ApiModelProperty(value = "所属部门")
    private java.lang.String sysOrgCode;
	/**杆塔号*/
    @ApiModelProperty(value = "杆塔号")
    private java.lang.String towerNumber;
    /**杆塔id*/
    @ApiModelProperty(value = "杆塔id")
    private java.lang.String towerId;
	/**施工分包单位*/
	@Excel(name = "施工分包单位", width = 15)
    @ApiModelProperty(value = "施工分包单位")
    private java.lang.String subcontractor;
	/**计划开工时间*/
	@Excel(name = "计划开工时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "计划开工时间")
    private java.util.Date planStartTime;
	/**实际开工时间*/
	@Excel(name = "实际开工时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "实际开工时间")
    private java.util.Date actualStartTime;
	/**是否完成复测分坑*/
	@Excel(name = "是否完成复测分坑", width = 15)
    @ApiModelProperty(value = "是否完成复测分坑")
    private java.lang.String repeatPit;
	/**是否完成放样*/
	@Excel(name = "是否完成放样", width = 15)
    @ApiModelProperty(value = "是否完成放样")
    private java.lang.String lofting;
	/**是否完成基础开挖*/
	@Excel(name = "是否完成基础开挖", width = 15)
    @ApiModelProperty(value = "是否完成基础开挖")
    private java.lang.String excavate;
	/**是否完成基础浇筑*/
	@Excel(name = "是否完成基础浇筑", width = 15)
    @ApiModelProperty(value = "是否完成基础浇筑")
    private java.lang.String pouring;
	/**是否完成组塔*/
	@Excel(name = "是否完成组塔", width = 15)
    @ApiModelProperty(value = "是否完成组塔")
    private java.lang.String groupTower;
	/**当前状态*/
	@Excel(name = "当前状态", width = 15)
    @ApiModelProperty(value = "当前状态")
    private java.lang.String status;
	/**计划竣工时间*/
	@Excel(name = "计划竣工时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "计划竣工时间")
    private java.util.Date planOverTime;
	/**实际竣工时间*/
	@Excel(name = "实际竣工时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "实际竣工时间")
    private java.util.Date actualOverTime;
	/**是否受阻*/
	@Excel(name = "是否受阻", width = 15)
    @ApiModelProperty(value = "是否受阻")
    private java.lang.String blockStatus;
	/**受阻原因分类*/
	@Excel(name = "受阻原因分类", width = 15)
    @ApiModelProperty(value = "受阻原因分类")
    private java.lang.String blockType;
	/**具体问题*/
	@Excel(name = "具体问题", width = 15)
    @ApiModelProperty(value = "具体问题")
    private java.lang.String blockDetail;
	/**其他需要说明的问题*/
	@Excel(name = "其他需要说明的问题", width = 15)
    @ApiModelProperty(value = "其他需要说明的问题")
    private java.lang.String otherIssue;
	/**填报时间*/
	@Excel(name = "填报时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "填报时间")
    private java.util.Date reportTime;
}
