<template>
  <a-card :bordered="false" :class="'cust-erp-sub-tab'">
    <!-- 操作按钮区域 -->
    <div class="table-operator" v-if="mainId">
      <a-button @click="handleAdd" type="primary" icon="plus">新增</a-button>
      <a-button type="primary" icon="download" @click="handleExportXls('施工填报')">导出</a-button>
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

    <constructionMessage-modal ref="modalForm" @ok="modalFormOk" :mainId="mainId"></constructionMessage-modal>
  </a-card>
</template>

<script>

  import { JeecgListMixin } from '@/mixins/JeecgListMixin'
  import ConstructionMessageModal from './modules/ConstructionMessageModal'

  export default {
    name: "ConstructionMessageList",
    mixins:[JeecgListMixin],
    components: { ConstructionMessageModal },
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
            title:'施工分包单位',
            align:"center",
            dataIndex: 'subcontractor'
          },
          {
            title:'计划开工时间',
            align:"center",
            dataIndex: 'planStartTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
          },
          {
            title:'实际开工时间',
            align:"center",
            dataIndex: 'actualStartTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
          },
          {
            title:'是否完成复测分坑',
            align:"center",
            dataIndex: 'repeatPit'
          },
          {
            title:'是否完成放样',
            align:"center",
            dataIndex: 'lofting'
          },
          {
            title:'是否完成基础开挖',
            align:"center",
            dataIndex: 'excavate'
          },
          {
            title:'是否完成基础浇筑',
            align:"center",
            dataIndex: 'pouring'
          },
          {
            title:'是否完成组塔',
            align:"center",
            dataIndex: 'groupTower'
          },
          {
            title:'当前状态',
            align:"center",
            dataIndex: 'status'
          },
          {
            title:'计划竣工时间',
            align:"center",
            dataIndex: 'planOverTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
          },
          {
            title:'实际竣工时间',
            align:"center",
            dataIndex: 'actualOverTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
          },
          {
            title:'是否受阻',
            align:"center",
            dataIndex: 'blockStatus'
          },
          {
            title:'受阻原因分类',
            align:"center",
            dataIndex: 'blockType'
          },
          {
            title:'具体问题',
            align:"center",
            dataIndex: 'blockDetail'
          },
          {
            title:'其他需要说明的问题',
            align:"center",
            dataIndex: 'otherIssue'
          },
          {
            title:'填报时间',
            align:"center",
            dataIndex: 'reportTime',
            customRender:function (text) {
              return !text?"":(text.length>10?text.substr(0,10):text)
            }
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
          list: "/tower/tower/listConstructionMessageByMainId",
          delete: "/tower/tower/deleteConstructionMessage",
          deleteBatch: "/tower/tower/deleteBatchConstructionMessage",
          exportXlsUrl: "/tower/tower/exportConstructionMessage",
          importUrl: "/tower/tower/importConstructionMessage",
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
        fieldList.push({type:'string',value:'territorialId',text:'属地供电所',dictCode:''})
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
