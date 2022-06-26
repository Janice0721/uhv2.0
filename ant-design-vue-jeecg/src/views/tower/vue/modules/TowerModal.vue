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
        <a-row>
          <a-col :span="24">
            <a-form-model-item label="杆塔号" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="number">
              <a-input v-model="model.number" placeholder="请输入杆塔号" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="塔地址" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="address">
              <a-input v-model="model.address" placeholder="请输入塔地址" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="交界塔基归属乡镇" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="ascriptionTown">
              <a-input v-model="model.ascriptionTown" placeholder="请输入交界塔基归属乡镇" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="N坐标N/X(米)" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="coordinateN">
              <a-input v-model="model.coordinateN" placeholder="请输入N坐标N/X(米)" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="E坐标E/Y(米)" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="coordinateB">
              <a-input v-model="model.coordinateB" placeholder="请输入E坐标E/Y(米)" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="属地供电所id" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="territorialId">
              <a-input v-model="model.territorialId" placeholder="请输入属地供电所id" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="施单位（全称）" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="constructionUnit">
              <a-input v-model="model.constructionUnit" placeholder="请输入施单位（全称）" ></a-input>
            </a-form-model-item>
          </a-col>
          <a-col :span="24">
            <a-form-model-item label="监理单位（全称）" :labelCol="labelCol" :wrapperCol="wrapperCol" prop="overseerUnit">
              <a-input v-model="model.overseerUnit" placeholder="请输入监理单位（全称）" ></a-input>
            </a-form-model-item>
          </a-col>
        </a-row>
      </a-form-model>
    </a-spin>
  </j-modal>
</template>

<script>

  import { httpAction } from '@/api/manage'
  import { validateDuplicateValue } from '@/utils/util'

  export default {
    name: "TowerModal",
    components: { 
    },
    data () {
      return {
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
          add: "/tower/tower/add",
          edit: "/tower/tower/edit",
        }
     
      }
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