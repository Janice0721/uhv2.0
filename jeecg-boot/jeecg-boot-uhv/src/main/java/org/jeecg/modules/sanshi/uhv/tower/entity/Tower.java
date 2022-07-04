package org.jeecg.modules.sanshi.uhv.tower.entity;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.jeecgframework.poi.excel.annotation.Excel;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.jeecg.common.aspect.annotation.Dict;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @Description: 塔杆信息
 * @Author: jeecg-boot
 * @Date:   2022-07-03
 * @Version: V1.0
 */
@Data
@TableName("tower")
@ApiModel(value="tower对象", description="塔杆信息")
public class Tower implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键*/
	@TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "主键")
    private java.lang.String id;
	/**创建人*/
    @ApiModelProperty(value = "创建人")
    private java.lang.String createBy;
	/**创建日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建日期")
    private java.util.Date createTime;
	/**更新人*/
    @ApiModelProperty(value = "更新人")
    private java.lang.String updateBy;
	/**更新日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "更新日期")
    private java.util.Date updateTime;
	/**所属部门*/
    @ApiModelProperty(value = "所属部门")
    private java.lang.String sysOrgCode;
	/**杆塔号*/
    @Excel(name = "杆塔号", width = 15)
    @ApiModelProperty(value = "杆塔号")
    private java.lang.String number;
	/**塔地址*/
    @Excel(name = "塔地址", width = 15)
    @ApiModelProperty(value = "塔地址")
    private java.lang.String address;
	/**交界塔基归属乡镇*/
    @Excel(name = "交界塔基归属乡镇", width = 15)
    @ApiModelProperty(value = "交界塔基归属乡镇")
    private java.lang.String ascriptionTown;
	/**N坐标N/X(米)*/
    @Excel(name = "N坐标N/X(米)", width = 15)
    @ApiModelProperty(value = "N坐标N/X(米)")
    private java.lang.String coordinateN;
	/**E坐标E/Y(米)*/
    @Excel(name = "E坐标E/Y(米)", width = 15)
    @ApiModelProperty(value = "E坐标E/Y(米)")
    private java.lang.String coordinateB;
	/**属地供电所*/
    @Excel(name = "属地供电所", width = 15)
    @ApiModelProperty(value = "属地供电所")
    private java.lang.String territorialId;
	/**施单位（全称）*/
    @Excel(name = "施单位（全称）", width = 15)
    @ApiModelProperty(value = "施单位（全称）")
    private java.lang.String constructionUnit;
	/**监理单位（全称）*/
    @Excel(name = "监理单位（全称）", width = 15)
    @ApiModelProperty(value = "监理单位（全称）")
    private java.lang.String overseerUnit;
}
