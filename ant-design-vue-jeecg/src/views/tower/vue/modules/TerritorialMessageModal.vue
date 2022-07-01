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
         
        </a-row>
      </a-form-model>
    </a-spin>
  </j-modal>
</template>

<script>

  import { httpAction ,getAction} from '@/api/manage'
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
      // let params = {}
      //   for(let obj of this.formList){
      //     params[obj.key] = '';
      //   }
      //   this.model = Object.assign({}, params);
      this.modelDefault = JSON.parse(JSON.stringify(this.model))
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
