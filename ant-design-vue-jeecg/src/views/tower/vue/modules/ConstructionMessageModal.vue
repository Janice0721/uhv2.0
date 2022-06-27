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
        <!-- 
          <a-col :span="24">
            <a-form-model-item label="杆塔id" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="towerId">
              <a-input v-model="model.towerId"placeholder="请输入杆塔id" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="施工分包单位" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="subcontractor">
              <a-input v-model="model.subcontractor"placeholder="请输入施工分包单位" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="计划开工时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="planStartTime">
              <j-date placeholder="请选择计划开工时间" v-model="model.planStartTime" style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="实际开工时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="actualStartTime">
              <j-date placeholder="请选择实际开工时间" v-model="model.actualStartTime" style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成复测分坑" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="repeatPit">
              <a-input v-model="model.repeatPit"placeholder="请输入是否完成复测分坑" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成放样" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="lofting">
              <a-input v-model="model.lofting"placeholder="请输入是否完成放样" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成基础开挖" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="excavate">
              <a-input v-model="model.excavate"placeholder="请输入是否完成基础开挖" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成基础浇筑" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="pouring">
              <a-input v-model="model.pouring"placeholder="请输入是否完成基础浇筑" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成组塔" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="groupTower">
              <a-input v-model="model.groupTower"placeholder="请输入是否完成组塔" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="当前状态" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="status">
              <a-input v-model="model.status"placeholder="请输入当前状态" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="计划竣工时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="planOverTime">
              <j-date placeholder="请选择计划竣工时间" v-model="model.planOverTime" style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="实际竣工时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="actualOverTime">
              <j-date placeholder="请选择实际竣工时间" v-model="model.actualOverTime" style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否受阻" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockStatus">
              <a-input v-model="model.blockStatus"placeholder="请输入是否受阻" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="受阻原因分类" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockType">
              <a-input v-model="model.blockType"placeholder="请输入受阻原因分类" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="具体问题" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockDetail">
              <a-input v-model="model.blockDetail"placeholder="请输入具体问题" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="其他需要说明的问题" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="otherIssue">
              <a-input v-model="model.otherIssue" placeholder="请输入其他需要说明的问题" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="填报时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="reportTime">
              <j-date placeholder="请选择填报时间" v-model="model.reportTime" style="width: 100%" />
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
    name: "ConstructionMessageModal",
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
          add: "/tower/tower/addConstructionMessage?table_name=construction_message",
          edit: "/tower/tower/editConstructionMessage",
        }

      }
    },
    created () {
    //备份model原始值
      // this.modelDefault = JSON.parse(JSON.stringify(this.model));
      getAction('/getFormList?table_name=construction_message').then(res=>{
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
