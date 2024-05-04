<template>

</template>

<script setup>
import { getQiniuCofig, updateQiniuCofig } from '@/api/file/qiniu'

const { proxy } = getCurrentInstance();

const zones = ref(['华东', '华北', '华南', '北美', '东南亚'])
const dialog = ref(false)
const loading = ref(false)
const form = ref({ accessKey: '', secretKey: '', bucket: '', host: '', zone: '', type: '' })
const rules = ref({
        accessKey: [
          { required: true, message: '请输入accessKey', trigger: 'blur' }
        ],
        secretKey: [
          { required: true, message: '请输入secretKey', trigger: 'blur' }
        ],
        bucket: [
          { required: true, message: '请输入空间名称', trigger: 'blur' }
        ],
        host: [
          { required: true, message: '请输入外链域名', trigger: 'blur' }
        ],
        type: [
          { required: true, message: '空间类型不能为空', trigger: 'blur' }
        ]
      })

function init() {
  getQiniuCofig().then(res => {
    this.form = res
  })
}
function doSubmit() {
  proxy.$refs['form'].validate((valid) => {
        if (valid) {
          this.loading = true
          updateQiniuCofig(this.form).then(res => {
            proxy.$modal.$notify({
              title: '修改成功',
              type: 'success',
              duration: 2500
            })
            this.$parent.getList()
            this.loading = false
            this.dialog = false
          }).catch(err => {
            this.loading = false
            console.log(err.response.data.message)
          })
        } else {
          return false
        }
      })
    }
</script>

<style scoped>

</style>
