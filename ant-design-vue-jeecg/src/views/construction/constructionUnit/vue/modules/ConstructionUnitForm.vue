<template>
  <a-spin :spinning="confirmLoading">
    <j-form-container :disabled="formDisabled">
      <a-form-model ref="form" :model="model" :rules="validatorRules" slot="detail">
        <a-row v-for="(fl, index) in formList" :key="index">
          <a-col :span="24">
            <a-form-model-item :label="fl.text" :labelCol="labelCol" :wrapperCol="wrapperCol" :prop="fl.key">
              <a-input v-model="model[fl.key]" :placeholder="'请输入'+fl.text" ></a-input>
            </a-form-model-item>
          </a-col>
          <!-- <a-col :span="24">
            <a-form-model-item label="详细信息" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="detail">
              <a-input v-model="model.detail" placeholder="请输入详细信息"  ></a-input>
            </a-form-model-item>
          </a-col> -->
        </a-row>
      </a-form-model>
    </j-form-container>
  </a-spin>
</template>

<script>

  import { httpAction, getAction } from '@/api/manage'
  import { validateDuplicateValue } from '@/utils/util'

  export default {
    name: 'ConstructionUnitForm',
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
        formList:[],
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
          add: "/constructionUnit/constructionUnit/add?table_name=construction_unit",
          edit: "/constructionUnit/constructionUnit/edit?table_name=construction_unit",
          queryById: "/constructionUnit/constructionUnit/queryById"
        }
      }
    },
    computed: {
      formDisabled(){
        return this.disabled
      },
    },
    created () {
      getAction('/getFormList?table_name=construction_unit',).then(res=>{
        this.formList=res;
        // let params = {}
        // for(let obj of this.formList){
        //   params[obj.key] = '';
        // }
        // this.model = Object.assign({}, params);
      })
      this.modelDefault = JSON.parse(JSON.stringify(this.model))
      
      
    },
    methods: {
      add () {
         this.edit(this.modelDefault);
      },
      edit (record) {
        console.log(record)
        // alert(Object.assign({}, record))
        this.model = Object.assign({}, record);
        // alert(this.model)
        this.visible = true;
      },
      submitForm () {
        console.log(this.model)
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