package org.jeecg.modules.sanshi.uhv.tower.controller;

import org.jeecg.common.system.query.QueryGenerator;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.jeecg.common.system.base.controller.JeecgController;
import org.jeecg.common.api.vo.Result;
import org.jeecg.modules.sanshi.uhv.common.AddFunc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.Arrays;
import org.jeecg.common.util.oConvertUtils;
import org.jeecg.modules.sanshi.uhv.tower.entity.TerritorialMessage;
import org.jeecg.modules.sanshi.uhv.tower.entity.ConstructionMessage;
import org.jeecg.modules.sanshi.uhv.tower.entity.Tower;
import org.jeecg.modules.sanshi.uhv.tower.service.ITowerService;
import org.jeecg.modules.sanshi.uhv.tower.service.ITerritorialMessageService;
import org.jeecg.modules.sanshi.uhv.tower.service.IConstructionMessageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.jeecg.common.aspect.annotation.AutoLog;
import org.apache.shiro.SecurityUtils;
import org.jeecg.common.system.vo.LoginUser;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.def.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.view.JeecgEntityExcelView;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

 /**
 * @Description: 塔杆信息
 * @Author: jeecg-boot
 * @Date:   2022-07-03
 * @Version: V1.0
 */
@Api(tags="塔杆信息")
@RestController
@RequestMapping("/tower/tower")
@Slf4j
public class TowerController extends JeecgController<Tower, ITowerService> {

	@Autowired
	private ITowerService towerService;

	@Autowired
	private ITerritorialMessageService territorialMessageService;

	@Autowired
	private IConstructionMessageService constructionMessageService;


	/*---------------------------------主表处理-begin-------------------------------------*/

	/**
	 * 分页列表查询
	 * @param tower
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	@AutoLog(value = "塔杆信息-分页列表查询")
	@ApiOperation(value="塔杆信息-分页列表查询", notes="塔杆信息-分页列表查询")
	@GetMapping(value = "/list")
	public Result<?> queryPageList(Tower tower,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<Tower> queryWrapper = QueryGenerator.initQueryWrapper(tower, req.getParameterMap());
		Page<Tower> page = new Page<Tower>(pageNo, pageSize);
		IPage<Tower> pageList = towerService.page(page, queryWrapper);
		return Result.OK(pageList);
	}

	/**
     *   添加
     * @param tower
     * @return
     */
    @AutoLog(value = "塔杆信息-添加")
    @ApiOperation(value="塔杆信息-添加", notes="塔杆信息-添加")
    @PostMapping(value = "/add")
    public Result<?> add(@RequestBody String tower,@RequestParam("table_name")String table_name) throws SQLException {
		AddFunc addFunc=new AddFunc();
		addFunc.INSERT(tower,table_name);
        return Result.OK("添加成功！");
    }

    /**
     *  编辑
     * @param tower
     * @return
     */
    @AutoLog(value = "塔杆信息-编辑")
    @ApiOperation(value="塔杆信息-编辑", notes="塔杆信息-编辑")
    @PutMapping(value = "/edit")
    public Result<?> edit(@RequestBody String tower,@RequestParam("table_name")String table_name) throws SQLException {
		AddFunc addFunc=new AddFunc();
		addFunc.UPDATE(tower,table_name);
        return Result.OK("编辑成功!");
    }

    /**
     * 通过id删除
     * @param id
     * @return
     */
    @AutoLog(value = "塔杆信息-通过id删除")
    @ApiOperation(value="塔杆信息-通过id删除", notes="塔杆信息-通过id删除")
    @DeleteMapping(value = "/delete")
    public Result<?> delete(@RequestParam(name="id",required=true) String id) {
        towerService.delMain(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @AutoLog(value = "塔杆信息-批量删除")
    @ApiOperation(value="塔杆信息-批量删除", notes="塔杆信息-批量删除")
    @DeleteMapping(value = "/deleteBatch")
    public Result<?> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
        this.towerService.delBatchMain(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功!");
    }

    /**
     * 导出
     * @return
     */
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, Tower tower) {
        return super.exportXls(request, tower, Tower.class, "塔杆信息");
    }

    /**
     * 导入
     * @return
     */
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
        return super.importExcel(request, response, Tower.class);
    }
	/*---------------------------------主表处理-end-------------------------------------*/
	

    /*--------------------------------子表处理-属地供电所填报-begin----------------------------------------------*/
	/**
	 * 通过主表ID查询
	 * @return
	 */
	@AutoLog(value = "属地供电所填报-通过主表ID查询")
	@ApiOperation(value="属地供电所填报-通过主表ID查询", notes="属地供电所填报-通过主表ID查询")
	@GetMapping(value = "/listTerritorialMessageByMainId")
    public Result<?> listTerritorialMessageByMainId(TerritorialMessage territorialMessage,
                                                    @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                                                    @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                                                    HttpServletRequest req) {
        QueryWrapper<TerritorialMessage> queryWrapper = QueryGenerator.initQueryWrapper(territorialMessage, req.getParameterMap());
        Page<TerritorialMessage> page = new Page<TerritorialMessage>(pageNo, pageSize);
        IPage<TerritorialMessage> pageList = territorialMessageService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

	/**
	 * 添加
	 * @param territorialMessage
	 * @return
	 */
	@AutoLog(value = "属地供电所填报-添加")
	@ApiOperation(value="属地供电所填报-添加", notes="属地供电所填报-添加")
	@PostMapping(value = "/addTerritorialMessage")
	public Result<?> addTerritorialMessage(@RequestBody String territorialMessage,@RequestParam("table_name")String table_name) throws SQLException {
//		territorialMessageService.save(territorialMessage);
		AddFunc addFunc=new AddFunc();
		addFunc.INSERT(territorialMessage,table_name);
		return Result.OK("添加成功！");
	}

    /**
	 * 编辑
	 * @param territorialMessage
	 * @return
	 */
	@AutoLog(value = "属地供电所填报-编辑")
	@ApiOperation(value="属地供电所填报-编辑", notes="属地供电所填报-编辑")
	@PutMapping(value = "/editTerritorialMessage")
	public Result<?> editTerritorialMessage(@RequestBody String territorialMessage,@RequestParam("table_name")String table_name) throws SQLException {
//		territorialMessageService.updateById(territorialMessage);
		AddFunc addFunc=new AddFunc();
		addFunc.UPDATE(territorialMessage,table_name);
		return Result.OK("编辑成功!");
	}

	/**
	 * 通过id删除
	 * @param id
	 * @return
	 */
	@AutoLog(value = "属地供电所填报-通过id删除")
	@ApiOperation(value="属地供电所填报-通过id删除", notes="属地供电所填报-通过id删除")
	@DeleteMapping(value = "/deleteTerritorialMessage")
	public Result<?> deleteTerritorialMessage(@RequestParam(name="id",required=true) String id) {
		territorialMessageService.removeById(id);
		return Result.OK("删除成功!");
	}

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "属地供电所填报-批量删除")
	@ApiOperation(value="属地供电所填报-批量删除", notes="属地供电所填报-批量删除")
	@DeleteMapping(value = "/deleteBatchTerritorialMessage")
	public Result<?> deleteBatchTerritorialMessage(@RequestParam(name="ids",required=true) String ids) {
	    this.territorialMessageService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}

    /**
     * 导出
     * @return
     */
    @RequestMapping(value = "/exportTerritorialMessage")
    public ModelAndView exportTerritorialMessage(HttpServletRequest request, TerritorialMessage territorialMessage) {
		 // Step.1 组装查询条件
		 QueryWrapper<TerritorialMessage> queryWrapper = QueryGenerator.initQueryWrapper(territorialMessage, request.getParameterMap());
		 LoginUser sysUser = (LoginUser) SecurityUtils.getSubject().getPrincipal();

		 // Step.2 获取导出数据
		 List<TerritorialMessage> pageList = territorialMessageService.list(queryWrapper);
		 List<TerritorialMessage> exportList = null;

		 // 过滤选中数据
		 String selections = request.getParameter("selections");
		 if (oConvertUtils.isNotEmpty(selections)) {
			 List<String> selectionList = Arrays.asList(selections.split(","));
			 exportList = pageList.stream().filter(item -> selectionList.contains(item.getId())).collect(Collectors.toList());
		 } else {
			 exportList = pageList;
		 }

		 // Step.3 AutoPoi 导出Excel
		 ModelAndView mv = new ModelAndView(new JeecgEntityExcelView());
		 mv.addObject(NormalExcelConstants.FILE_NAME, "属地供电所填报"); //此处设置的filename无效 ,前端会重更新设置一下
		 mv.addObject(NormalExcelConstants.CLASS, TerritorialMessage.class);
		 mv.addObject(NormalExcelConstants.PARAMS, new ExportParams("属地供电所填报报表", "导出人:" + sysUser.getRealname(), "属地供电所填报"));
		 mv.addObject(NormalExcelConstants.DATA_LIST, exportList);
		 return mv;
    }

    /**
     * 导入
     * @return
     */
    @RequestMapping(value = "/importTerritorialMessage/{mainId}")
    public Result<?> importTerritorialMessage(HttpServletRequest request, HttpServletResponse response, @PathVariable("mainId") String mainId) {
		 MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		 Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		 for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			 MultipartFile file = entity.getValue();// 获取上传文件对象
			 ImportParams params = new ImportParams();
			 params.setTitleRows(2);
			 params.setHeadRows(1);
			 params.setNeedSave(true);
			 try {
				 List<TerritorialMessage> list = ExcelImportUtil.importExcel(file.getInputStream(), TerritorialMessage.class, params);
				 for (TerritorialMessage temp : list) {
                    temp.setTowerId(mainId);
				 }
				 long start = System.currentTimeMillis();
				 territorialMessageService.saveBatch(list);
				 log.info("消耗时间" + (System.currentTimeMillis() - start) + "毫秒");
				 return Result.OK("文件导入成功！数据行数：" + list.size());
			 } catch (Exception e) {
				 log.error(e.getMessage(), e);
				 return Result.error("文件导入失败:" + e.getMessage());
			 } finally {
				 try {
					 file.getInputStream().close();
				 } catch (IOException e) {
					 e.printStackTrace();
				 }
			 }
		 }
		 return Result.error("文件导入失败！");
    }

    /*--------------------------------子表处理-属地供电所填报-end----------------------------------------------*/

    /*--------------------------------子表处理-施工填报-begin----------------------------------------------*/
	/**
	 * 通过主表ID查询
	 * @return
	 */
	@AutoLog(value = "施工填报-通过主表ID查询")
	@ApiOperation(value="施工填报-通过主表ID查询", notes="施工填报-通过主表ID查询")
	@GetMapping(value = "/listConstructionMessageByMainId")
    public Result<?> listConstructionMessageByMainId(ConstructionMessage constructionMessage,
                                                    @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                                                    @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                                                    HttpServletRequest req) {
        QueryWrapper<ConstructionMessage> queryWrapper = QueryGenerator.initQueryWrapper(constructionMessage, req.getParameterMap());
        Page<ConstructionMessage> page = new Page<ConstructionMessage>(pageNo, pageSize);
        IPage<ConstructionMessage> pageList = constructionMessageService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

	/**
	 * 添加
	 * @param constructionMessage
	 * @return
	 */
	@AutoLog(value = "施工填报-添加")
	@ApiOperation(value="施工填报-添加", notes="施工填报-添加")
	@PostMapping(value = "/addConstructionMessage")
	public Result<?> addConstructionMessage(@RequestBody String constructionMessage,@RequestParam("table_name")String table_name) throws SQLException {
//		constructionMessageService.save(constructionMessage);
		AddFunc addFunc=new AddFunc();
		addFunc.INSERT(constructionMessage,table_name);
		return Result.OK("添加成功！");
	}

    /**
	 * 编辑
	 * @param constructionMessage
	 * @return
	 */
	@AutoLog(value = "施工填报-编辑")
	@ApiOperation(value="施工填报-编辑", notes="施工填报-编辑")
	@PutMapping(value = "/editConstructionMessage")
	public Result<?> editConstructionMessage(@RequestBody String constructionMessage,@RequestParam("table_name")String table_name) throws SQLException {
//		constructionMessageService.updateById(constructionMessage);
		AddFunc addFunc=new AddFunc();
		addFunc.UPDATE(constructionMessage,table_name);
		return Result.OK("编辑成功!");
	}

	/**
	 * 通过id删除
	 * @param id
	 * @return
	 */
	@AutoLog(value = "施工填报-通过id删除")
	@ApiOperation(value="施工填报-通过id删除", notes="施工填报-通过id删除")
	@DeleteMapping(value = "/deleteConstructionMessage")
	public Result<?> deleteConstructionMessage(@RequestParam(name="id",required=true) String id) {
		constructionMessageService.removeById(id);
		return Result.OK("删除成功!");
	}

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	@AutoLog(value = "施工填报-批量删除")
	@ApiOperation(value="施工填报-批量删除", notes="施工填报-批量删除")
	@DeleteMapping(value = "/deleteBatchConstructionMessage")
	public Result<?> deleteBatchConstructionMessage(@RequestParam(name="ids",required=true) String ids) {
	    this.constructionMessageService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.OK("批量删除成功!");
	}

    /**
     * 导出
     * @return
     */
    @RequestMapping(value = "/exportConstructionMessage")
    public ModelAndView exportConstructionMessage(HttpServletRequest request, ConstructionMessage constructionMessage) {
		 // Step.1 组装查询条件
		 QueryWrapper<ConstructionMessage> queryWrapper = QueryGenerator.initQueryWrapper(constructionMessage, request.getParameterMap());
		 LoginUser sysUser = (LoginUser) SecurityUtils.getSubject().getPrincipal();

		 // Step.2 获取导出数据
		 List<ConstructionMessage> pageList = constructionMessageService.list(queryWrapper);
		 List<ConstructionMessage> exportList = null;

		 // 过滤选中数据
		 String selections = request.getParameter("selections");
		 if (oConvertUtils.isNotEmpty(selections)) {
			 List<String> selectionList = Arrays.asList(selections.split(","));
			 exportList = pageList.stream().filter(item -> selectionList.contains(item.getId())).collect(Collectors.toList());
		 } else {
			 exportList = pageList;
		 }

		 // Step.3 AutoPoi 导出Excel
		 ModelAndView mv = new ModelAndView(new JeecgEntityExcelView());
		 mv.addObject(NormalExcelConstants.FILE_NAME, "施工填报"); //此处设置的filename无效 ,前端会重更新设置一下
		 mv.addObject(NormalExcelConstants.CLASS, ConstructionMessage.class);
		 mv.addObject(NormalExcelConstants.PARAMS, new ExportParams("施工填报报表", "导出人:" + sysUser.getRealname(), "施工填报"));
		 mv.addObject(NormalExcelConstants.DATA_LIST, exportList);
		 return mv;
    }

    /**
     * 导入
     * @return
     */
    @RequestMapping(value = "/importConstructionMessage/{mainId}")
    public Result<?> importConstructionMessage(HttpServletRequest request, HttpServletResponse response, @PathVariable("mainId") String mainId) {
		 MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		 Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		 for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			 MultipartFile file = entity.getValue();// 获取上传文件对象
			 ImportParams params = new ImportParams();
			 params.setTitleRows(2);
			 params.setHeadRows(1);
			 params.setNeedSave(true);
			 try {
				 List<ConstructionMessage> list = ExcelImportUtil.importExcel(file.getInputStream(), ConstructionMessage.class, params);
				 for (ConstructionMessage temp : list) {
                    temp.setTowerId(mainId);
				 }
				 long start = System.currentTimeMillis();
				 constructionMessageService.saveBatch(list);
				 log.info("消耗时间" + (System.currentTimeMillis() - start) + "毫秒");
				 return Result.OK("文件导入成功！数据行数：" + list.size());
			 } catch (Exception e) {
				 log.error(e.getMessage(), e);
				 return Result.error("文件导入失败:" + e.getMessage());
			 } finally {
				 try {
					 file.getInputStream().close();
				 } catch (IOException e) {
					 e.printStackTrace();
				 }
			 }
		 }
		 return Result.error("文件导入失败！");
    }

    /*--------------------------------子表处理-施工填报-end----------------------------------------------*/




}
