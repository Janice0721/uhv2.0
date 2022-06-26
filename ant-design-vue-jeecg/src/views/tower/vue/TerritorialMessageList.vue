<template>
  <a-card :bordered="false" :class="'cust-erp-sub-tab'">
    <!-- 操作按钮区域 -->
    <div class="table-operator" v-if="mainId">
      <a-button @click="handleAdd" type="primary" icon="plus">新增</a-button>
      <a-button type="primary" icon="download" @click="handleExportXls('属地供电所填报')">导出</a-button>
      <a-upload
        name="file"
        :showUploadList="false"
        :multiple="false"
        :headers="tokenHeader"
        :action="importExcelUrl"
        @change="handleImportExcel">
          <a-button type="primary" icon="import">导入</a-button>
      </a-upload>
      <!-- 高级查询区域 -->
      <j-super-query :fieldList="superFieldList" ref="superQueryModal" @handleSuperQuery="handleSuperQuery"></j-super-query>
      <a-dropdown v-if="selectedRowKeys.length > 0">
        <a-menu slot="overlay">
          <a-menu-item key="1" @click="batchDel"><a-icon type="delete"/>删除</a-menu-item>
        </a-menu>
        <a-button style="margin-left: 8px"> 批量操作 <a-icon type="down" /></a-button>
      </a-dropdown>
    </div>

    <!-- table区域-begin -->
    <div>
      <div class="ant-alert ant-alert-info" style="margin-bottom: 16px;">
        <i class="anticon anticon-info-circle ant-alert-icon"></i> 已选择 <a style="font-weight: 600">{{ selectedRowKeys.length }}</a>项
        <a style="margin-left: 24px" @click="onClearSelected">清空</a>
      </div>

      <a-table
        ref="table"
        size="middle"
        bordered
        rowKey="id"
        :scroll="{x:true}"
        :columns="columns"
        :dataSource="dataSource"
        :pagination="ipagination"
        :loading="loading"
        :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange}"
        @change="handleTableChange">

        <template slot="htmlSlot" slot-scope="text">
          <div v-html="text"></div>
        </template>
        <template slot="imgSlot" slot-scope="text">
          <span v-if="!text" style="font-size: 12px;font-style: italic;">无图片</span>
          <img v-else :src="getImgView(text)" height="25px" alt="" style="max-width:80px;font-size: 12px;font-style: italic;"/>
        </template>
        <template slot="fileSlot" slot-scope="text">
          <span v-if="!text" style="font-size: 12px;font-style: italic;">无文件</span>
          <a-button
            v-else
            :ghost="true"
            type="primary"
            icon="download"
            size="small"
            @click="downloadFile(text)">
            下载
          </a-button>
        </template>

        <span slot="action" slot-scope="text, record">
          <a @click="handleEdit(record)">编辑</a>
          <a-divider type="vertical" />
          <a-popconfirm title="确定删除吗?" @confirm="() => handleDelete(record.id)">
            <a>删除</a>
          </a-popconfirm>
        </span>

      </a-table>
    </div>

    <territorialMessage-modal ref="modalForm" @ok="modalFormOk" :mainId="mainId"></territorialMessage-modal>
  </a-card>
</template>

<script>

  import { JeecgListMixin } from '@/mixins/JeecgListMixin'
  import TerritorialMessageModal from './modules/TerritorialMessageModal'

  export default {
    name: "TerritorialMessageList",
    mixins:[JeecgListMixin],
    components: { TerritorialMessageModal },
    props:{
      mainId:{
        type:String,
        default:'',
        required:false
      }
    },
    watch:{
      mainId:{
        immediate: true,
        handler(val) {
          if(!this.mainId){
            this.clearList()
          }else{
            this.queryParam['towerId'] = val
            this.loadData(1);
          }
        }
      }
    },
    data () {
      return {
        description: '塔杆信息管理页面',
        disableMixinCreated:true,
        // 表头
        columns: [
          {
            title: '#',
            dataIndex: '',
            key:'rowIndex',
            width:60,
            align:"center",
            customRender:function (t,r,index) {
              return parseInt(index)+1;
            }
          },
          {
            title:'杆塔id',
            align:"center",
            dataIndex: 'towerId'
          },
          {
            title:'塔基林木采伐证办理情况',
            align:"center",
            dataIndex: 'registration'
          },
          {
            title:'与乡镇签订情况',
            align:"center",
            dataIndex: 'baseSignStatus'
          },
          {
            title:'付款至乡镇情况',
            align:"center",
            dataIndex: 'basePayStatus'
          },
          {
            title:'丈量到户',
            align:"center",
            dataIndex: 'acquisitionMeasureHome'
          },
          {
            title:'与村民（承包人、经营人）签定情况',
            align:"center",
            dataIndex: 'acquisitionPeopleSign'
          },
          {
            title:'付款至村民（承包人、经营人）情况',
            align:"center",
            dataIndex: 'acquisitionPeoplePay'
          },
          {
            title:'村民（承包人、经营人）姓名',
            align:"center",
            dataIndex: 'acquisitionPeopleName'
          },
          {
            title:'村民（承包人、经营人）电话',
            align:"center",
            dataIndex: 'acquisitionPeoplePhone'
          },
          {
            title:'村民（承包人、经营人）用电户号',
            align:"center",
            dataIndex: 'acquisitionPeopleElectricity'
          },
          {
            title:'塔基交地情况',
            align:"center",
            dataIndex: 'baseLandStatus'
          },
          {
            title:'塔基未交地原因',
            align:"center",
            dataIndex: 'baseReasons'
          },
          {
            title:'塔基是否清表',
            align:"center",
            dataIndex: 'baseClearTable'
          },
          {
            title:'塔基计划交地时间',
            align:"center",
            dataIndex: 'basePlanTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
          },
          {
            title:'塔基实际交地时间',
            align:"center",
            dataIndex: 'baseActualTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
          },
          {
            title:'施工便道用地范围确认',
            align:"center",
            dataIndex: 'easyRange'
          },
          {
            title:'便道签订情况',
            align:"center",
            dataIndex: 'easySignStatus'
          },
          {
            title:'便道付款情况',
            align:"center",
            dataIndex: 'easyPayStatus'
          },
          {
            title:'便道是否交地',
            align:"center",
            dataIndex: 'easyLandStatus'
          },
          {
            title:'便道未交地原因',
            align:"center",
            dataIndex: 'easyReason'
          },
          {
            title:'便道是否清表',
            align:"center",
            dataIndex: 'easyClearTable'
          },
          {
            title:' 便道计划交地时间',
            align:"center",
            dataIndex: 'easyPlanTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
          },
          {
            title:'便道实际交地时间',
            align:"center",
            dataIndex: 'easyActualTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
          },
          {
            title:'牵张场签订情况',
            align:"center",
            dataIndex: 'stretchSignStatus'
          },
          {
            title:'牵张场付款情况',
            align:"center",
            dataIndex: 'stretchPayStatus'
          },
          {
            title:'牵张场交地情况',
            align:"center",
            dataIndex: 'stretchLandStatus'
          },
          {
            title:'管线迁移',
            align:"center",
            dataIndex: 'pipeLineStatus'
          },
          {
            title:'房屋拆迁',
            align:"center",
            dataIndex: 'houseStatus'
          },
          {
            title:'是否受阻',
            align:"center",
            dataIndex: 'blockStatus'
          },
          {
            title:'受阻原因分类',
            align:"center",
            dataIndex: 'blockReasonType'
          },
          {
            title:'具体问题',
            align:"center",
            dataIndex: 'blockDetail'
          },
          {
            title:'是否亮红灯',
            align:"center",
            dataIndex: 'lightStatus'
          },
          {
            title:'亮灯天数',
            align:"center",
            dataIndex: 'lightDay'
          },
          {
            title:'填报时间',
            align:"center",
            dataIndex: 'fillingTime'
          },
          {
            title: '操作',
            dataIndex: 'action',
            align:"center",
            fixed:"right",
            width:147,
            scopedSlots: { customRender: 'action' },
          }
        ],
        url: {
          list: "/tower/tower/listTerritorialMessageByMainId",
          delete: "/tower/tower/deleteTerritorialMessage",
          deleteBatch: "/tower/tower/deleteBatchTerritorialMessage",
          exportXlsUrl: "/tower/tower/exportTerritorialMessage",
          importUrl: "/tower/tower/importTerritorialMessage",
        },
        dictOptions:{
        },
        superFieldList:[],
      }
    },
    created() {
      this.getSuperFieldList();
    },
    computed: {
      importExcelUrl(){
        return `${window._CONFIG['domianURL']}/${this.url.importUrl}/${this.mainId}`;
      }
    },
    methods: {
      clearList(){
        this.dataSource=[]
        this.selectedRowKeys=[]
        this.ipagination.current = 1
      },
      getSuperFieldList(){
        let fieldList=[];
        fieldList.push({type:'string',value:'number',text:'杆塔号',dictCode:''})
        fieldList.push({type:'string',value:'address',text:'塔地址',dictCode:''})
        fieldList.push({type:'string',value:'ascriptionTown',text:'交界塔基归属乡镇',dictCode:''})
        fieldList.push({type:'string',value:'coordinateN',text:'N坐标N/X(米)',dictCode:''})
        fieldList.push({type:'string',value:'coordinateB',text:'E坐标E/Y(米)',dictCode:''})
        fieldList.push({type:'string',value:'territorialId',text:'属地供电所id',dictCode:''})
        fieldList.push({type:'string',value:'constructionUnit',text:'施单位（全称）',dictCode:''})
        fieldList.push({type:'string',value:'overseerUnit',text:'监理单位（全称）',dictCode:''})
        this.superFieldList = fieldList
      }
    }
  }
</script>
<style scoped>
  @import '~@assets/less/common.less'
</style>
