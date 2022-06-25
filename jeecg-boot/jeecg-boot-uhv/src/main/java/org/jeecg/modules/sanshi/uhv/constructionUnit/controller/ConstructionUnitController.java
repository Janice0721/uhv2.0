package org.jeecg.modules.sanshi.uhv.constructionUnit.controller;

import java.sql.Connection;
import java.util.*;
import java.util.stream.Collectors;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.jeecg.common.api.vo.Result;
import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.common.util.oConvertUtils;
import org.jeecg.modules.sanshi.uhv.constructionUnit.entity.ConstructionUnit;
import org.jeecg.modules.sanshi.uhv.constructionUnit.service.IConstructionUnitService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.def.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.view.JeecgEntityExcelView;
import org.jeecg.common.system.base.controller.JeecgController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.JdbcUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.jeecg.common.aspect.annotation.AutoLog;

 /**
 * @Description: 施工单位
 * @Author: jeecg-boot
 * @Date:   2022-06-24
 * @Version: V1.0
 */
@Api(tags="施工单位")
@RestController
@RequestMapping("/constructionUnit/constructionUnit")
@Slf4j
public class ConstructionUnitController extends JeecgController<ConstructionUnit, IConstructionUnitService> {
	@Autowired
	private IConstructionUnitService constructionUnitService;
	
	/**
	 * 分页列表查询
	 *
	 * @param constructionUnit
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	@AutoLog(value = "施工单位-分页列表查询")
	@ApiOperation(value="施工单位-分页列表查询", notes="施工单位-分页列表查询")
	@GetMapping(value = "/list")
	public Result<?> queryPageList(ConstructionUnit constructionUnit,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<ConstructionUnit> queryWrapper = QueryGenerator.initQueryWrapper(constructionUnit, req.getParameterMap());
		Page<ConstructionUnit> page = new Page<ConstructionUnit>(pageNo, pageSize);
		IPage<ConstructionUnit> pageList = constructionUnitService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param constructionUnit
	 * @return
	 */
	@AutoLog(value = "施工单位-添加")
	@ApiOperation(value="施工单位-添加", notes="施工单位-添加")
	@PostMapping(value = "/add")
	public Result<?> add(@RequestBody ConstructionUnit constructionUnit) {
		constructionUnitService.save(constructionUnit);
//		System.out.println(constructionUnit);
//		Map<String,String > constructionMap = JSON.parseObject(constructionUnit, Map.class);
//		System.out.println(map);
//		insert into construction_unit(id,test,name,detail) values(null,'1','2','3')

		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param constructionUnit
	 * @return
	 */
	@AutoLog(value = "施工单位-编辑")
	@ApiOperation(value="施工单位-编辑", notes="施工单位-编辑")
	@PutMapping(value = "/edit")
	public Result<?> edit(@RequestBody ConstructionUnit constructionUnit) {
		constructionUnitService.updateById(constructionUnit);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "施工单位-通过id删除")
	@ApiOperation(value="施工单位-通过id删除", notes="施工单位-通过id删除")
	@DeleteMapping(value = "/delete")
	public Result<?> delete(@RequestParam(name="id",required=true) String id) {
		constructionUnitService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "施工单位-批量删除")
	@ApiOperation(value="施工单位-批量删除", notes="施工单位-批量删除")
	@DeleteMapping(value = "/deleteBatch")
	public Result<?> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.constructionUnitService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "施工单位-通过id查询")
	@ApiOperation(value="施工单位-通过id查询", notes="施工单位-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<?> queryById(@RequestParam(name="id",required=true) String id) {
		ConstructionUnit constructionUnit = constructionUnitService.getById(id);
		if(constructionUnit==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(constructionUnit);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param constructionUnit
    */
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, ConstructionUnit constructionUnit) {
        return super.exportXls(request, constructionUnit, ConstructionUnit.class, "施工单位");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
		return super.importExcel(request, response, ConstructionUnit.class);
	}

 }
