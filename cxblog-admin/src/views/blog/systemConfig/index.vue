<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="七牛云公钥" prop="qiNiuAccessKey">
        <el-input
          v-model="queryParams.qiNiuAccessKey"
          placeholder="请输入七牛云公钥"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="七牛云私钥" prop="qiNiuSecretKey">
        <el-input
          v-model="queryParams.qiNiuSecretKey"
          placeholder="请输入七牛云私钥"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="七牛云存储区域 华东" prop="qiNiuArea">
        <el-input
          v-model="queryParams.qiNiuArea"
          placeholder="请输入七牛云存储区域 华东"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="七牛云上传空间" prop="qiNiuBucket">
        <el-input
          v-model="queryParams.qiNiuBucket"
          placeholder="请输入七牛云上传空间"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="七牛云域名前缀：http://images.moguit.cn" prop="qiNiuPictureBaseUrl">
        <el-input
          v-model="queryParams.qiNiuPictureBaseUrl"
          placeholder="请输入七牛云域名前缀：http://images.moguit.cn"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件上传七牛云(0:否， 1:是)" prop="uploadQiNiu">
        <el-input
          v-model="queryParams.uploadQiNiu"
          placeholder="请输入文件上传七牛云(0:否， 1:是)"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否开启注册用户邮件激活(0:否， 1:是)" prop="openEmailActivate">
        <el-input
          v-model="queryParams.openEmailActivate"
          placeholder="请输入是否开启注册用户邮件激活(0:否， 1:是)"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否开启邮件通知(0:否， 1:是)" prop="startEmailNotification">
        <el-input
          v-model="queryParams.startEmailNotification"
          placeholder="请输入是否开启邮件通知(0:否， 1:是)"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否开启仪表盘通知(0:否， 1:是)" prop="openDashboardNotification">
        <el-input
          v-model="queryParams.openDashboardNotification"
          placeholder="请输入是否开启仪表盘通知(0:否， 1:是)"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="搜索模式【0:SQL搜索 、1：全文检索】" prop="searchModel">
        <el-input
          v-model="queryParams.searchModel"
          placeholder="请输入搜索模式【0:SQL搜索 、1：全文检索】"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱地址" prop="emailHost">
        <el-input
          v-model="queryParams.emailHost"
          placeholder="请输入邮箱地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱发件人" prop="emailUsername">
        <el-input
          v-model="queryParams.emailUsername"
          placeholder="请输入邮箱发件人"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱授权码" prop="emailPassword">
        <el-input
          v-model="queryParams.emailPassword"
          placeholder="请输入邮箱授权码"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱发送端口" prop="emailPort">
        <el-input
          v-model="queryParams.emailPort"
          placeholder="请输入邮箱发送端口"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="启用邮箱发送" prop="openEmail">
        <el-input
          v-model="queryParams.openEmail"
          placeholder="请输入启用邮箱发送"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="本地文件地址" prop="localFileUrl">
        <el-input
          v-model="queryParams.localFileUrl"
          placeholder="请输入本地文件地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件上传方式 1:本地 2：七牛云" prop="fileUploadWay">
        <el-input
          v-model="queryParams.fileUploadWay"
          placeholder="请输入文件上传方式 1:本地 2：七牛云"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="阿里云ak" prop="aliYunAccessKey">
        <el-input
          v-model="queryParams.aliYunAccessKey"
          placeholder="请输入阿里云ak"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="阿里云sk" prop="aliYunSecretKey">
        <el-input
          v-model="queryParams.aliYunSecretKey"
          placeholder="请输入阿里云sk"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="阿里云存储桶名" prop="aliYunBucket">
        <el-input
          v-model="queryParams.aliYunBucket"
          placeholder="请输入阿里云存储桶名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="阿里云Endpoint" prop="aliYunEndpoint">
        <el-input
          v-model="queryParams.aliYunEndpoint"
          placeholder="请输入阿里云Endpoint"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['blog:systemConfig:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:systemConfig:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:systemConfig:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:systemConfig:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="systemConfigList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="七牛云公钥" align="center" prop="qiNiuAccessKey" />
      <el-table-column label="七牛云私钥" align="center" prop="qiNiuSecretKey" />
      <el-table-column label="七牛云存储区域 华东" align="center" prop="qiNiuArea" />
      <el-table-column label="七牛云上传空间" align="center" prop="qiNiuBucket" />
      <el-table-column label="七牛云域名前缀：http://images.moguit.cn" align="center" prop="qiNiuPictureBaseUrl" />
      <el-table-column label="文件上传七牛云(0:否， 1:是)" align="center" prop="uploadQiNiu" />
      <el-table-column label="是否开启注册用户邮件激活(0:否， 1:是)" align="center" prop="openEmailActivate" />
      <el-table-column label="是否开启邮件通知(0:否， 1:是)" align="center" prop="startEmailNotification" />
      <el-table-column label="是否开启仪表盘通知(0:否， 1:是)" align="center" prop="openDashboardNotification" />
      <el-table-column label="仪表盘通知【用于首次登录弹框】MD" align="center" prop="dashboardNotificationMd" />
      <el-table-column label="仪表盘通知【用于首次登录弹框】" align="center" prop="dashboardNotification" />
      <el-table-column label="搜索模式【0:SQL搜索 、1：全文检索】" align="center" prop="searchModel" />
      <el-table-column label="邮箱地址" align="center" prop="emailHost" />
      <el-table-column label="邮箱发件人" align="center" prop="emailUsername" />
      <el-table-column label="邮箱授权码" align="center" prop="emailPassword" />
      <el-table-column label="邮箱发送端口" align="center" prop="emailPort" />
      <el-table-column label="启用邮箱发送" align="center" prop="openEmail" />
      <el-table-column label="本地文件地址" align="center" prop="localFileUrl" />
      <el-table-column label="文件上传方式 1:本地 2：七牛云" align="center" prop="fileUploadWay" />
      <el-table-column label="阿里云ak" align="center" prop="aliYunAccessKey" />
      <el-table-column label="阿里云sk" align="center" prop="aliYunSecretKey" />
      <el-table-column label="阿里云存储桶名" align="center" prop="aliYunBucket" />
      <el-table-column label="阿里云Endpoint" align="center" prop="aliYunEndpoint" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['blog:systemConfig:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['blog:systemConfig:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改系统配置对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="systemConfigRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="七牛云公钥" prop="qiNiuAccessKey">
          <el-input v-model="form.qiNiuAccessKey" placeholder="请输入七牛云公钥" />
        </el-form-item>
        <el-form-item label="七牛云私钥" prop="qiNiuSecretKey">
          <el-input v-model="form.qiNiuSecretKey" placeholder="请输入七牛云私钥" />
        </el-form-item>
        <el-form-item label="七牛云存储区域 华东" prop="qiNiuArea">
          <el-input v-model="form.qiNiuArea" placeholder="请输入七牛云存储区域 华东" />
        </el-form-item>
        <el-form-item label="七牛云上传空间" prop="qiNiuBucket">
          <el-input v-model="form.qiNiuBucket" placeholder="请输入七牛云上传空间" />
        </el-form-item>
        <el-form-item label="七牛云域名前缀：http://images.moguit.cn" prop="qiNiuPictureBaseUrl">
          <el-input v-model="form.qiNiuPictureBaseUrl" placeholder="请输入七牛云域名前缀：http://images.moguit.cn" />
        </el-form-item>
        <el-form-item label="文件上传七牛云(0:否， 1:是)" prop="uploadQiNiu">
          <el-input v-model="form.uploadQiNiu" placeholder="请输入文件上传七牛云(0:否， 1:是)" />
        </el-form-item>
        <el-form-item label="是否开启注册用户邮件激活(0:否， 1:是)" prop="openEmailActivate">
          <el-input v-model="form.openEmailActivate" placeholder="请输入是否开启注册用户邮件激活(0:否， 1:是)" />
        </el-form-item>
        <el-form-item label="是否开启邮件通知(0:否， 1:是)" prop="startEmailNotification">
          <el-input v-model="form.startEmailNotification" placeholder="请输入是否开启邮件通知(0:否， 1:是)" />
        </el-form-item>
        <el-form-item label="是否开启仪表盘通知(0:否， 1:是)" prop="openDashboardNotification">
          <el-input v-model="form.openDashboardNotification" placeholder="请输入是否开启仪表盘通知(0:否， 1:是)" />
        </el-form-item>
        <el-form-item label="仪表盘通知【用于首次登录弹框】MD" prop="dashboardNotificationMd">
          <el-input v-model="form.dashboardNotificationMd" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="仪表盘通知【用于首次登录弹框】" prop="dashboardNotification">
          <el-input v-model="form.dashboardNotification" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="搜索模式【0:SQL搜索 、1：全文检索】" prop="searchModel">
          <el-input v-model="form.searchModel" placeholder="请输入搜索模式【0:SQL搜索 、1：全文检索】" />
        </el-form-item>
        <el-form-item label="邮箱地址" prop="emailHost">
          <el-input v-model="form.emailHost" placeholder="请输入邮箱地址" />
        </el-form-item>
        <el-form-item label="邮箱发件人" prop="emailUsername">
          <el-input v-model="form.emailUsername" placeholder="请输入邮箱发件人" />
        </el-form-item>
        <el-form-item label="邮箱授权码" prop="emailPassword">
          <el-input v-model="form.emailPassword" placeholder="请输入邮箱授权码" />
        </el-form-item>
        <el-form-item label="邮箱发送端口" prop="emailPort">
          <el-input v-model="form.emailPort" placeholder="请输入邮箱发送端口" />
        </el-form-item>
        <el-form-item label="启用邮箱发送" prop="openEmail">
          <el-input v-model="form.openEmail" placeholder="请输入启用邮箱发送" />
        </el-form-item>
        <el-form-item label="本地文件地址" prop="localFileUrl">
          <el-input v-model="form.localFileUrl" placeholder="请输入本地文件地址" />
        </el-form-item>
        <el-form-item label="文件上传方式 1:本地 2：七牛云" prop="fileUploadWay">
          <el-input v-model="form.fileUploadWay" placeholder="请输入文件上传方式 1:本地 2：七牛云" />
        </el-form-item>
        <el-form-item label="阿里云ak" prop="aliYunAccessKey">
          <el-input v-model="form.aliYunAccessKey" placeholder="请输入阿里云ak" />
        </el-form-item>
        <el-form-item label="阿里云sk" prop="aliYunSecretKey">
          <el-input v-model="form.aliYunSecretKey" placeholder="请输入阿里云sk" />
        </el-form-item>
        <el-form-item label="阿里云存储桶名" prop="aliYunBucket">
          <el-input v-model="form.aliYunBucket" placeholder="请输入阿里云存储桶名" />
        </el-form-item>
        <el-form-item label="阿里云Endpoint" prop="aliYunEndpoint">
          <el-input v-model="form.aliYunEndpoint" placeholder="请输入阿里云Endpoint" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="SystemConfig">
import { listSystemConfig, getSystemConfig, delSystemConfig, addSystemConfig, updateSystemConfig } from "@/api/blog/systemConfig";

const { proxy } = getCurrentInstance();

const systemConfigList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    qiNiuAccessKey: null,
    qiNiuSecretKey: null,
    qiNiuArea: null,
    qiNiuBucket: null,
    qiNiuPictureBaseUrl: null,
    uploadQiNiu: null,
    openEmailActivate: null,
    startEmailNotification: null,
    openDashboardNotification: null,
    dashboardNotificationMd: null,
    dashboardNotification: null,
    searchModel: null,
    emailHost: null,
    emailUsername: null,
    emailPassword: null,
    emailPort: null,
    openEmail: null,
    localFileUrl: null,
    fileUploadWay: null,
    aliYunAccessKey: null,
    aliYunSecretKey: null,
    aliYunBucket: null,
    aliYunEndpoint: null,
  },
  rules: {
    startEmailNotification: [
      { required: true, message: "是否开启邮件通知(0:否， 1:是)不能为空", trigger: "blur" }
    ],
    openDashboardNotification: [
      { required: true, message: "是否开启仪表盘通知(0:否， 1:是)不能为空", trigger: "blur" }
    ],
    searchModel: [
      { required: true, message: "搜索模式【0:SQL搜索 、1：全文检索】不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询系统配置列表 */
function getList() {
  loading.value = true;
  listSystemConfig(queryParams.value).then(response => {
    systemConfigList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    qiNiuAccessKey: null,
    qiNiuSecretKey: null,
    qiNiuArea: null,
    qiNiuBucket: null,
    qiNiuPictureBaseUrl: null,
    uploadQiNiu: null,
    openEmailActivate: null,
    startEmailNotification: null,
    openDashboardNotification: null,
    dashboardNotificationMd: null,
    dashboardNotification: null,
    searchModel: null,
    emailHost: null,
    emailUsername: null,
    emailPassword: null,
    emailPort: null,
    openEmail: null,
    localFileUrl: null,
    fileUploadWay: null,
    aliYunAccessKey: null,
    aliYunSecretKey: null,
    aliYunBucket: null,
    aliYunEndpoint: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("systemConfigRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加系统配置";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getSystemConfig(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改系统配置";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["systemConfigRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateSystemConfig(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addSystemConfig(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除系统配置编号为"' + _ids + '"的数据项？').then(function() {
    return delSystemConfig(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('blog/systemConfig/export', {
    ...queryParams.value
  }, `systemConfig_${new Date().getTime()}.xlsx`)
}

getList();
</script>
