package org.jeecg.modules.sanshi.uhv.territorial.controller;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jeecg.common.api.vo.Result;
import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.common.util.oConvertUtils;
import org.jeecg.modules.sanshi.uhv.common.AddFunc;
import org.jeecg.modules.sanshi.uhv.territorial.entity.TerritorialStation;
import org.jeecg.modules.sanshi.uhv.territorial.service.ITerritorialStationService;

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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.jeecg.common.aspect.annotation.AutoLog;

 /**
 * @Description: 属地供电所
 * @Author: jeecg-boot
 * @Date:   2022-06-26
 * @Version: V1.0
 */
@Api(tags="属地供电所")
@RestController
@RequestMapping("/territorial/territorialStation")
//http://localhost:8085/dev-api/territorial/territorialStation/add
@Slf4j
public class TerritorialStationController extends JeecgController<TerritorialStation, ITerritorialStationService> {
	@Autowired
	private ITerritorialStationService territorialStationService;
	
	/**
	 * 分页列表查询
	 *
	 * @param territorialStation
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	@AutoLog(value = "属地供电所-分页列表查询")
	@ApiOperation(value="属地供电所-分页列表查询", notes="属地供电所-分页列表查询")
	@GetMapping(value = "/list")
	public Result<?> queryPageList(TerritorialStation territorialStation,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<TerritorialStation> queryWrapper = QueryGenerator.initQueryWrapper(territorialStation, req.getParameterMap());
		Page<TerritorialStation> page = new Page<TerritorialStation>(pageNo, pageSize);
		IPage<TerritorialStation> pageList = territorialStationService.page(page, queryWrapper);
		return Result.OK(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param territorialStation
	 * @return
	 */
	@AutoLog(value = "属地供电所-添加")
	@ApiOperation(value="属地供电所-添加", notes="属地供电所-添加")
	@PostMapping(value = "/add")
	public Result<?> add(@RequestBody String territorialStation,@RequestParam("table_name")String table_name) throws SQLException {
		AddFunc addFunc=new AddFunc();
		addFunc.INSERT(territorialStation,table_name);
		//	territorialStationService.save(territorialStation);
		return Result.OK("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param territorialStation
	 * @return
	 */
	@AutoLog(value = "属地供电所-编辑")
	@ApiOperation(value="属地供电所-编辑", notes="属地供电所-编辑")
	@PutMapping(value = "/edit")
	public Result<?> edit(@RequestBody TerritorialStation territorialStation) {
		territorialStationService.updateById(territorialStation);
		return Result.OK("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "属地供电所-通过id删除")
	@ApiOperation(value="属地供电所-通过id删除", notes="属地供电所-通过id删除")
	@DeleteMapping(value = "/delete")
	public Result<?> delete(@RequestParam(name="id",required=true) String id) {
		territorialStationService.removeById(id);
		return Result.OK("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "属地供电所-批量删除")
	@ApiOperation(value="属地供电所-批量删除", notes="属地供电所-批量删除")
	@DeleteMapping(value = "/deleteBatch")
	public Result<?> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.territorialStationService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	@AutoLog(value = "属地供电所-通过id查询")
	@ApiOperation(value="属地供电所-通过id查询", notes="属地供电所-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<?> queryById(@RequestParam(name="id",required=true) String id) {
		TerritorialStation territorialStation = territorialStationService.getById(id);
		if(territorialStation==null) {
			return Result.error("未找到对应数据");
		}
		return Result.OK(territorialStation);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param territorialStation
    */
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, TerritorialStation territorialStation) {
        return super.exportXls(request, territorialStation, TerritorialStation.class, "属地供电所");
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
        return super.importExcel(request, response, TerritorialStation.class);
    }

}
