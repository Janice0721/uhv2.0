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
 * @Description: 属地供电所填报
 * @Author: jeecg-boot
 * @Date:   2022-06-26
 * @Version: V1.0
 */
@Data
@TableName("territorial_message")
@ApiModel(value="territorial_message对象", description="属地供电所填报")
public class TerritorialMessage implements Serializable {
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
	/**杆塔id*/
    @ApiModelProperty(value = "杆塔id")
    private java.lang.String towerId;
	/**塔基林木采伐证办理情况*/
	@Excel(name = "塔基林木采伐证办理情况", width = 15)
    @ApiModelProperty(value = "塔基林木采伐证办理情况")
    private java.lang.String registration;
	/**与乡镇签订情况*/
	@Excel(name = "与乡镇签订情况", width = 15)
    @ApiModelProperty(value = "与乡镇签订情况")
    private java.lang.String baseSignStatus;
	/**付款至乡镇情况*/
	@Excel(name = "付款至乡镇情况", width = 15)
    @ApiModelProperty(value = "付款至乡镇情况")
    private java.lang.String basePayStatus;
	/**丈量到户*/
	@Excel(name = "丈量到户", width = 15)
    @ApiModelProperty(value = "丈量到户")
    private java.lang.String acquisitionMeasureHome;
	/**与村民（承包人、经营人）签定情况*/
	@Excel(name = "与村民（承包人、经营人）签定情况", width = 15)
    @ApiModelProperty(value = "与村民（承包人、经营人）签定情况")
    private java.lang.String acquisitionPeopleSign;
	/**付款至村民（承包人、经营人）情况*/
	@Excel(name = "付款至村民（承包人、经营人）情况", width = 15)
    @ApiModelProperty(value = "付款至村民（承包人、经营人）情况")
    private java.lang.String acquisitionPeoplePay;
	/**村民（承包人、经营人）姓名*/
	@Excel(name = "村民（承包人、经营人）姓名", width = 15)
    @ApiModelProperty(value = "村民（承包人、经营人）姓名")
    private java.lang.String acquisitionPeopleName;
	/**村民（承包人、经营人）电话*/
	@Excel(name = "村民（承包人、经营人）电话", width = 15)
    @ApiModelProperty(value = "村民（承包人、经营人）电话")
    private java.lang.String acquisitionPeoplePhone;
	/**村民（承包人、经营人）用电户号*/
	@Excel(name = "村民（承包人、经营人）用电户号", width = 15)
    @ApiModelProperty(value = "村民（承包人、经营人）用电户号")
    private java.lang.String acquisitionPeopleElectricity;
	/**塔基交地情况*/
	@Excel(name = "塔基交地情况", width = 15)
    @ApiModelProperty(value = "塔基交地情况")
    private java.lang.String baseLandStatus;
	/**塔基未交地原因*/
	@Excel(name = "塔基未交地原因", width = 15)
    @ApiModelProperty(value = "塔基未交地原因")
    private java.lang.String baseReasons;
	/**塔基是否清表*/
	@Excel(name = "塔基是否清表", width = 15)
    @ApiModelProperty(value = "塔基是否清表")
    private java.lang.String baseClearTable;
	/**塔基计划交地时间*/
	@Excel(name = "塔基计划交地时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "塔基计划交地时间")
    private java.util.Date basePlanTime;
	/**塔基实际交地时间*/
	@Excel(name = "塔基实际交地时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "塔基实际交地时间")
    private java.util.Date baseActualTime;
	/**施工便道用地范围确认*/
	@Excel(name = "施工便道用地范围确认", width = 15)
    @ApiModelProperty(value = "施工便道用地范围确认")
    private java.lang.String easyRange;
	/**便道签订情况*/
	@Excel(name = "便道签订情况", width = 15)
    @ApiModelProperty(value = "便道签订情况")
    private java.lang.String easySignStatus;
	/**便道付款情况*/
	@Excel(name = "便道付款情况", width = 15)
    @ApiModelProperty(value = "便道付款情况")
    private java.lang.String easyPayStatus;
	/**便道是否交地*/
	@Excel(name = "便道是否交地", width = 15)
    @ApiModelProperty(value = "便道是否交地")
    private java.lang.String easyLandStatus;
	/**便道未交地原因*/
	@Excel(name = "便道未交地原因", width = 15)
    @ApiModelProperty(value = "便道未交地原因")
    private java.lang.String easyReason;
	/**便道是否清表*/
	@Excel(name = "便道是否清表", width = 15)
    @ApiModelProperty(value = "便道是否清表")
    private java.lang.String easyClearTable;
	/** 便道计划交地时间*/
	@Excel(name = " 便道计划交地时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = " 便道计划交地时间")
    private java.util.Date easyPlanTime;
	/**便道实际交地时间*/
	@Excel(name = "便道实际交地时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @ApiModelProperty(value = "便道实际交地时间")
    private java.util.Date easyActualTime;
	/**牵张场签订情况*/
	@Excel(name = "牵张场签订情况", width = 15)
    @ApiModelProperty(value = "牵张场签订情况")
    private java.lang.String stretchSignStatus;
	/**牵张场付款情况*/
	@Excel(name = "牵张场付款情况", width = 15)
    @ApiModelProperty(value = "牵张场付款情况")
    private java.lang.String stretchPayStatus;
	/**牵张场交地情况*/
	@Excel(name = "牵张场交地情况", width = 15)
    @ApiModelProperty(value = "牵张场交地情况")
    private java.lang.String stretchLandStatus;
	/**管线迁移*/
	@Excel(name = "管线迁移", width = 15)
    @ApiModelProperty(value = "管线迁移")
    private java.lang.String pipeLineStatus;
	/**房屋拆迁*/
	@Excel(name = "房屋拆迁", width = 15)
    @ApiModelProperty(value = "房屋拆迁")
    private java.lang.String houseStatus;
	/**是否受阻*/
	@Excel(name = "是否受阻", width = 15)
    @ApiModelProperty(value = "是否受阻")
    private java.lang.String blockStatus;
	/**受阻原因分类*/
	@Excel(name = "受阻原因分类", width = 15)
    @ApiModelProperty(value = "受阻原因分类")
    private java.lang.String blockReasonType;
	/**具体问题*/
	@Excel(name = "具体问题", width = 15)
    @ApiModelProperty(value = "具体问题")
    private java.lang.String blockDetail;
	/**是否亮红灯*/
	@Excel(name = "是否亮红灯", width = 15)
    @ApiModelProperty(value = "是否亮红灯")
    private java.lang.String lightStatus;
	/**亮灯天数*/
	@Excel(name = "亮灯天数", width = 15)
    @ApiModelProperty(value = "亮灯天数")
    private java.lang.String lightDay;
	/**填报时间*/
	@Excel(name = "填报时间", width = 15)
    @ApiModelProperty(value = "填报时间")
    private java.lang.String fillingTime;
}
