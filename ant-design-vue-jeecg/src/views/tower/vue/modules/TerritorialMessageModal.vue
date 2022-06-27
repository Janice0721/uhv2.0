<template>
  <j-modal
    :title="title"
    :width="width"
    :visible="visible"
    :confirmLoading="confirmLoading"
    switchFullscreen
    @ok="handleOk"
    @cancel="handleCancel"
    cancelText="关闭">
    <a-spin :spinning="confirmLoading">
      <a-form-model ref="form" :model="model" :rules="validatorRules">
        <a-row v-for="form in formList">
          <a-col :span="24">
            <a-form-model-item :label="form.text" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="form.key">
              <a-input v-model="model[form.key]" :placeholder="'请输入'+form.text"  ></a-input>
            </a-form-model-item>
          </a-col>
          <!-- <a-col :span="24">
            <a-form-model-item label="塔基林木采伐证办理情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="registration">
              <a-input v-model="model.registration"placeholder="请输入塔基林木采伐证办理情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="与乡镇签订情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="baseSignStatus">
              <a-input v-model="model.baseSignStatus"placeholder="请输入与乡镇签订情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="付款至乡镇情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="basePayStatus">
              <a-input v-model="model.basePayStatus"placeholder="请输入付款至乡镇情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="丈量到户" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="acquisitionMeasureHome">
              <a-input v-model="model.acquisitionMeasureHome"placeholder="请输入丈量到户" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="与村民（承包人、经营人）签定情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="acquisitionPeopleSign">
              <a-input v-model="model.acquisitionPeopleSign"placeholder="请输入与村民（承包人、经营人）签定情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="付款至村民（承包人、经营人）情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="acquisitionPeoplePay">
              <a-input v-model="model.acquisitionPeoplePay"placeholder="请输入付款至村民（承包人、经营人）情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="村民（承包人、经营人）姓名" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="acquisitionPeopleName">
              <a-input v-model="model.acquisitionPeopleName"placeholder="请输入村民（承包人、经营人）姓名" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="村民（承包人、经营人）电话" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="acquisitionPeoplePhone">
              <a-input v-model="model.acquisitionPeoplePhone"placeholder="请输入村民（承包人、经营人）电话" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="村民（承包人、经营人）用电户号" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="acquisitionPeopleElectricity">
              <a-input v-model="model.acquisitionPeopleElectricity"placeholder="请输入村民（承包人、经营人）用电户号" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="塔基交地情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="baseLandStatus">
              <a-input v-model="model.baseLandStatus"placeholder="请输入塔基交地情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="塔基未交地原因" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="baseReasons">
              <a-input v-model="model.baseReasons"placeholder="请输入塔基未交地原因" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="塔基是否清表" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="baseClearTable">
              <a-input v-model="model.baseClearTable"placeholder="请输入塔基是否清表" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="塔基计划交地时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="basePlanTime">
              <j-date placeholder="请选择塔基计划交地时间" v-model="model.basePlanTime" style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="塔基实际交地时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="baseActualTime">
              <j-date placeholder="请选择塔基实际交地时间" v-model="model.baseActualTime" style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="施工便道用地范围确认" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="easyRange">
              <a-input v-model="model.easyRange"placeholder="请输入施工便道用地范围确认" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="便道签订情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="easySignStatus">
              <a-input v-model="model.easySignStatus"placeholder="请输入便道签订情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="便道付款情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="easyPayStatus">
              <a-input v-model="model.easyPayStatus"placeholder="请输入便道付款情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="便道是否交地" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="easyLandStatus">
              <a-input v-model="model.easyLandStatus"placeholder="请输入便道是否交地" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="便道未交地原因" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="easyReason">
              <a-input v-model="model.easyReason"placeholder="请输入便道未交地原因" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="便道是否清表" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="easyClearTable">
              <a-input v-model="model.easyClearTable"placeholder="请输入便道是否清表" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label=" 便道计划交地时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="easyPlanTime">
              <j-date placeholder="请选择 便道计划交地时间" v-model="model.easyPlanTime" style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="便道实际交地时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="easyActualTime">
              <j-date placeholder="请选择便道实际交地时间" v-model="model.easyActualTime" style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="牵张场签订情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="stretchSignStatus">
              <a-input v-model="model.stretchSignStatus"placeholder="请输入牵张场签订情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="牵张场付款情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="stretchPayStatus">
              <a-input v-model="model.stretchPayStatus"placeholder="请输入牵张场付款情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="牵张场交地情况" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="stretchLandStatus">
              <a-input v-model="model.stretchLandStatus"placeholder="请输入牵张场交地情况" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="管线迁移" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="pipeLineStatus">
              <a-input v-model="model.pipeLineStatus"placeholder="请输入管线迁移" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="房屋拆迁" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="houseStatus">
              <a-input v-model="model.houseStatus"placeholder="请输入房屋拆迁" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否受阻" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockStatus">
              <a-input v-model="model.blockStatus"placeholder="请输入是否受阻" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="受阻原因分类" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockReasonType">
              <a-input v-model="model.blockReasonType"placeholder="请输入受阻原因分类" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="具体问题" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockDetail">
              <a-input v-model="model.blockDetail"placeholder="请输入具体问题" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否亮红灯" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="lightStatus">
              <a-input v-model="model.lightStatus"placeholder="请输入是否亮红灯" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="亮灯天数" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="lightDay">
              <a-input v-model="model.lightDay"placeholder="请输入亮灯天数" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="填报时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="fillingTime">
              <a-input v-model="model.fillingTime"placeholder="请输入填报时间" ></a-input>
            </a-form-model-item>
          </a-col> -->
        </a-row>
      </a-form-model>
    </a-spin>
  </j-modal>
</template>

<script>

  import { httpAction } from '@/api/manage'
  import { validateDuplicateValue } from '@/utils/util'

  export default {
    name: "TerritorialMessageModal",
    components: {
    },
    props:{
      mainId:{
        type:String,
        required:false,
        default:''
      }
    },
    data () {
      return {
        formList: [],
        title:"操作",
        width:800,
        visible: false,
        model:{
        },
        labelCol: {
          xs: { span: 24 },
          sm: { span: 5 },
        },
        wrapperCol: {
          xs: { span: 24 },
          sm: { span: 16 },
        },

        confirmLoading: false,
        validatorRules: {
        },
        url: {
          add: "/tower/tower/addTerritorialMessage?table_name=territorial_message",
          edit: "/tower/tower/editTerritorialMessage",
        }

      }
    },
    created () {
    //备份model原始值
      // this.modelDefault = JSON.parse(JSON.stringify(this.model));
       getAction('/getFormList?table_name=territorial_message').then(res=>{
        this.formList=res;
      })
      let params = {}
        for(let obj of this.formList){
          params[obj.key] = '';
        }
        this.model = Object.assign({}, params);
    },
    methods: {
      add () {
        this.edit(this.modelDefault);
      },
      edit (record) {
        this.model = Object.assign({}, record);
        this.visible = true;
      },
      close () {
        this.$emit('close');
        this.visible = false;
        this.$refs.form.clearValidate();
      },
      handleOk () {
        const that = this;
        // 触发表单验证
        this.$refs.form.validate(valid => {
          if (valid) {
            that.confirmLoading = true;
            let httpurl = '';
            let method = '';
            if(!this.model.id){
              httpurl+=this.url.add;
              method = 'post';
            }else{
              httpurl+=this.url.edit;
               method = 'put';
            }
            this.model['towerId'] = this.mainId
            httpAction(httpurl,this.model,method).then((res)=>{
              if(res.success){
                that.$message.success(res.message);
                that.$emit('ok');
              }else{
                that.$message.warning(res.message);
              }
            }).finally(() => {
              that.confirmLoading = false;
              that.close();
            })
          }else{
             return false
          }
        })
      },
      handleCancel () {
        this.close()
      },


    }
  }
</script>
