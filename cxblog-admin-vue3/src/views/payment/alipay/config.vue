<template>
  <el-form ref="formRef" :model="form" :rules="rules" style="margin-top: 6px;" size="small" label-width="100px">
    <el-form-item label="appID" prop="appId">
      <el-input v-model="form.appId" style="width: 40%" />
      <span style="color: #C0C0C0;margin-left: 10px;">应用APPID,收款账号既是APPID对应支付宝账号</span>
    </el-form-item>
    <el-form-item label="商家账号" prop="sysServiceProviderId">
      <el-input v-model="form.sysServiceProviderId" style="width: 40%;" />
      <span style="color: #C0C0C0;margin-left: 10px;">商家账号</span>
    </el-form-item>
    <el-form-item label="商户私钥" prop="privateKey">
      <el-input v-model="form.privateKey" type="password" style="width: 40%;" />
      <span style="color: #C0C0C0;margin-left: 10px;">商户私钥，你的PKCS8格式RSA2私钥</span>
    </el-form-item>
    <el-form-item label="支付宝公钥" prop="publicKey">
      <el-input v-model="form.publicKey" type="password" style="width: 40%;" />
      <span style="color: #C0C0C0;margin-left: 10px;">支付宝公钥</span>
    </el-form-item>
    <el-form-item label="网关地址" prop="gatewayUrl">
      <el-input v-model="form.gatewayUrl" style="width: 40%;" />
      <span style="color: #C0C0C0;margin-left: 10px;">支付宝网关地址</span>
    </el-form-item>
    <el-form-item label="回调地址" prop="returnUrl">
      <el-input v-model="form.returnUrl" style="width: 40%;" />
      <span style="color: #C0C0C0;margin-left: 10px;">订单完成后返回的地址</span>
    </el-form-item>
    <el-form-item label="异步通知" prop="notifyUrl">
      <el-input v-model="form.notifyUrl" style="width: 40%;" />
      <span style="color: #C0C0C0;margin-left: 10px;">支付结果异步通知地址</span>
    </el-form-item>
    <el-form-item label="">
      <el-button :loading="loading" size="medium" type="primary" @click="doSubmit">保存配置</el-button>
    </el-form-item>
  </el-form>
</template>

<script setup>
import { get, update } from '@/api/payment/alipay'

      const loading = ref(false)
const form = ref({ appId: '', sysServiceProviderId: '', privateKey: '', publicKey: '', gatewayUrl: '', returnUrl: '', notifyUrl: '' })
const rules = ref({
        appId: [
          { required: true, message: '请输入appID', trigger: 'blur' }
        ],
        sysServiceProviderId: [
          { required: true, message: '请输入商家账号', trigger: 'blur' }
        ],
        privateKey: [
          { required: true, message: '商户私钥不能为空', trigger: 'blur' }
        ],
        publicKey: [
          { required: true, message: '支付宝公钥不能为空', trigger: 'blur' }
        ],
        gatewayUrl: [
          { required: true, message: '网关地址不能为空', trigger: 'blur' }
        ],
        returnUrl: [
          { required: true, message: '回调地址不能为空', trigger: 'blur' }
        ],
        notifyUrl: [
          { required: true, message: '回调地址不能为空', trigger: 'blur' }
        ]
})


    function init() {
      get().then(res => {
        form.value = res.data
      })
    }
    function doSubmit() {
      proxy.$refs['formRef'].validate((valid) => {
        if (valid) {
          loading.value = true
          update(form.value).then(res => {
            proxy.$modal.notify('修改成功')
            loading.value = false
          }).catch(err => {
            loading.value = false
            console.log(err.response.data.message)
          })
        } else {
          return false
        }
      })
}
init()
</script>

<style scoped>

</style>
