<template>
  <el-form ref="formRef" :model="form" :rules="rules" style="margin-top: 6px;" size="small" label-width="100px">
    <el-form-item label="发件人邮箱" prop="fromUser">
      <el-input v-model="form.fromUser" style="width: 40%"/>
      <span style="color: #C0C0C0;margin-left: 10px;">Sender mailbox</span>
    </el-form-item>
    <el-form-item label="发件用户名" prop="user">
      <el-input v-model="form.user" style="width: 40%;"/>
      <span style="color: #C0C0C0;margin-left: 10px;">Sender usernamex</span>
    </el-form-item>
    <el-form-item label="邮箱密码" prop="pass">
      <el-input v-model="form.pass" type="password" style="width: 40%;"/>
      <span style="color: #C0C0C0;margin-left: 10px;">email Password</span>
    </el-form-item>
    <el-form-item label="SMTP地址" prop="host">
      <el-input v-model="form.host" style="width: 40%;"/>
      <span style="color: #C0C0C0;margin-left: 10px;">SMTP address</span>
    </el-form-item>
    <el-form-item label="SMTP端口" prop="port">
      <el-input v-model="form.port" style="width: 40%;"/>
      <span style="color: #C0C0C0;margin-left: 10px;">SMTP port</span>
    </el-form-item>
    <el-form-item label="">
      <el-button :loading="loading" size="medium" type="primary" @click="doSubmit">保存配置</el-button>
    </el-form-item>
  </el-form>
</template>

<script setup>
import {get, update} from '@/api/msg/email'
const {proxy} = getCurrentInstance();
const loading = ref(false);
const form = ref({id: 1, fromUser: '', user: '', pass: '', host: '', port: '', sslEnable: ''});
const rules = ref({
  fromUser: [
    {required: true, message: '请输入发件人邮箱', trigger: 'blur'},
    {type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur'}
  ],
  user: [
    {required: true, message: '请输入发件用户名', trigger: 'blur'}
  ],
  pass: [
    {required: true, message: '密码不能为空', trigger: 'blur'}
  ],
  host: [
    {required: true, message: 'SMTP地址不能为空', trigger: 'blur'}
  ],
  port: [
    {required: true, message: 'SMTP端口不能为空', trigger: 'blur'}
  ]
});

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
        proxy.$modal.notifySuccess("修改成功")
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
