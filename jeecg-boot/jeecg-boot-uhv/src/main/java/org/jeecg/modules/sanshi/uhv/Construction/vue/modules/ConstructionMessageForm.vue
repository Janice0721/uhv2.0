<template>
  <a-spin :spinning="confirmLoading">
    <j-form-container :disabled="formDisabled">
      <a-form-model ref="form" :model="model" :rules="validatorRules" slot="detail">
        <a-row>
          <a-col :span="24">
            <a-form-model-item label="塔杆id" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="towerId">
              <a-input v-model="model.towerId" placeholder="请输入塔杆id"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="施工分包单位" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="subcontractor">
              <a-input v-model="model.subcontractor" placeholder="请输入施工分包单位"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="计划开始时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="planStartTime">
              <j-date placeholder="请选择计划开始时间" v-model="model.planStartTime"  style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="实际开始时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="actualStartTime">
              <j-date placeholder="请选择实际开始时间" v-model="model.actualStartTime"  style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成复测分抗" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="repeatPit">
              <a-input v-model="model.repeatPit" placeholder="请输入是否完成复测分抗"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成放样" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="lofting">
              <a-input v-model="model.lofting" placeholder="请输入是否完成放样"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成基础开挖" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="excavate">
              <a-input v-model="model.excavate" placeholder="请输入是否完成基础开挖"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成基础浇筑" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="pouring">
              <a-input v-model="model.pouring" placeholder="请输入是否完成基础浇筑"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否完成组塔" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="groupTower">
              <a-input v-model="model.groupTower" placeholder="请输入是否完成组塔"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="当前状态" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="status">
              <a-input v-model="model.status" placeholder="请输入当前状态"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="计划竣工时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="planOverTime">
              <j-date placeholder="请选择计划竣工时间" v-model="model.planOverTime"  style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="实际竣工时间" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="actualOverTime">
              <j-date placeholder="请选择实际竣工时间" v-model="model.actualOverTime"  style="width: 100%" />
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="是否受阻" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockStatus">
              <a-input v-model="model.blockStatus" placeholder="请输入是否受阻"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="受阻原因分类" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockType">
              <a-input v-model="model.blockType" placeholder="请输入受阻原因分类"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="具体问题" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="blockDetail">
              <a-input v-model="model.blockDetail" placeholder="请输入具体问题"  ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="其他需要说明的问题" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="otherIssue">
              <a-input v-model="model.otherIssue" placeholder="请输入其他需要说明的问题"  ></a-input>
            </a-form-model-item>
          </a-col>
        </a-row>
      </a-form-model>
    </j-form-container>
  </a-spin>
</template>

<script>

  import { httpAction, getAction } from '@/api/manage'
  import { validateDuplicateValue } from '@/utils/util'

  export default {
    name: 'ConstructionMessageForm',
    components: {
    },
    props: {
      //表单禁用
      disabled: {
        type: Boolean,
        default: false,
        required: false
      }
    },
    data () {
      return {
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
          add: "/Construction/constructionMessage/add",
          edit: "/Construction/constructionMessage/edit",
          queryById: "/Construction/constructionMessage/queryById"
        }
      }
    },
    computed: {
      formDisabled(){
        return this.disabled
      },
    },
    created () {
       //备份model原始值
      this.modelDefault = JSON.parse(JSON.stringify(this.model));
    },
    methods: {
      add () {
        this.edit(this.modelDefault);
      },
      edit (record) {
        this.model = Object.assign({}, record);
        this.visible = true;
      },
      submitForm () {
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
            httpAction(httpurl,this.model,method).then((res)=>{
              if(res.success){
                that.$message.success(res.message);
                that.$emit('ok');
              }else{
                that.$message.warning(res.message);
              }
            }).finally(() => {
              that.confirmLoading = false;
            })
          }
         
        })
      },
    }
  }
</script>