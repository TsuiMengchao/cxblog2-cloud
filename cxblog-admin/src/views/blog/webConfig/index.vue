<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="logo(文件UID)" prop="logo">
        <el-input
          v-model="queryParams.logo"
          placeholder="请输入logo(文件UID)"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网站名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入网站名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="介绍" prop="summary">
        <el-input
          v-model="queryParams.summary"
          placeholder="请输入介绍"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关键字" prop="keyword">
        <el-input
          v-model="queryParams.keyword"
          placeholder="请输入关键字"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作者" prop="author">
        <el-input
          v-model="queryParams.author"
          placeholder="请输入作者"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备案号" prop="recordNum">
        <el-input
          v-model="queryParams.recordNum"
          placeholder="请输入备案号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网站地址" prop="webUrl">
        <el-input
          v-model="queryParams.webUrl"
          placeholder="请输入网站地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付宝收款码FileId" prop="aliPay">
        <el-input
          v-model="queryParams.aliPay"
          placeholder="请输入支付宝收款码FileId"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="微信收款码FileId" prop="weixinPay">
        <el-input
          v-model="queryParams.weixinPay"
          placeholder="请输入微信收款码FileId"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="github地址" prop="github">
        <el-input
          v-model="queryParams.github"
          placeholder="请输入github地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="gitee地址" prop="gitee">
        <el-input
          v-model="queryParams.gitee"
          placeholder="请输入gitee地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="QQ号" prop="qqNumber">
        <el-input
          v-model="queryParams.qqNumber"
          placeholder="请输入QQ号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="QQ群" prop="qqGroup">
        <el-input
          v-model="queryParams.qqGroup"
          placeholder="请输入QQ群"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input
          v-model="queryParams.email"
          placeholder="请输入邮箱"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="微信" prop="wechat">
        <el-input
          v-model="queryParams.wechat"
          placeholder="请输入微信"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="显示的列表" prop="showList">
        <el-input
          v-model="queryParams.showList"
          placeholder="请输入显示的列表"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录方式列表" prop="loginTypeList">
        <el-input
          v-model="queryParams.loginTypeList"
          placeholder="请输入登录方式列表"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否开启评论(0:否 1:是)" prop="openComment">
        <el-input
          v-model="queryParams.openComment"
          placeholder="请输入是否开启评论(0:否 1:是)"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否开启赞赏(0:否， 1:是)" prop="openAdmiration">
        <el-input
          v-model="queryParams.openAdmiration"
          placeholder="请输入是否开启赞赏(0:否， 1:是)"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="游客头像" prop="touristAvatar">
        <el-input
          v-model="queryParams.touristAvatar"
          placeholder="请输入游客头像"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公告" prop="bulletin">
        <el-input
          v-model="queryParams.bulletin"
          placeholder="请输入公告"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作者简介" prop="authorInfo">
        <el-input
          v-model="queryParams.authorInfo"
          placeholder="请输入作者简介"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作者头像" prop="authorAvatar">
        <el-input
          v-model="queryParams.authorAvatar"
          placeholder="请输入作者头像"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否开启音乐播放器" prop="isMusicPlayer">
        <el-input
          v-model="queryParams.isMusicPlayer"
          placeholder="请输入是否开启音乐播放器"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否显示公告  0 不显示 1显示" prop="showBulletin">
        <el-input
          v-model="queryParams.showBulletin"
          placeholder="请输入是否显示公告  0 不显示 1显示"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版权声明" prop="copyright">
        <el-input
          v-model="queryParams.copyright"
          placeholder="请输入版权声明"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发布时间" prop="releaseTime">
        <el-date-picker clearable
          v-model="queryParams.releaseTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择发布时间">
        </el-date-picker>
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
          v-hasPermi="['blog:webConfig:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:webConfig:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:webConfig:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:webConfig:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="webConfigList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="logo(文件UID)" align="center" prop="logo" />
      <el-table-column label="网站名称" align="center" prop="name" />
      <el-table-column label="介绍" align="center" prop="summary" />
      <el-table-column label="关键字" align="center" prop="keyword" />
      <el-table-column label="作者" align="center" prop="author" />
      <el-table-column label="备案号" align="center" prop="recordNum" />
      <el-table-column label="网站地址" align="center" prop="webUrl" />
      <el-table-column label="支付宝收款码FileId" align="center" prop="aliPay" />
      <el-table-column label="微信收款码FileId" align="center" prop="weixinPay" />
      <el-table-column label="github地址" align="center" prop="github" />
      <el-table-column label="gitee地址" align="center" prop="gitee" />
      <el-table-column label="QQ号" align="center" prop="qqNumber" />
      <el-table-column label="QQ群" align="center" prop="qqGroup" />
      <el-table-column label="邮箱" align="center" prop="email" />
      <el-table-column label="微信" align="center" prop="wechat" />
      <el-table-column label="显示的列表" align="center" prop="showList" />
      <el-table-column label="登录方式列表" align="center" prop="loginTypeList" />
      <el-table-column label="是否开启评论(0:否 1:是)" align="center" prop="openComment" />
      <el-table-column label="是否开启赞赏(0:否， 1:是)" align="center" prop="openAdmiration" />
      <el-table-column label="游客头像" align="center" prop="touristAvatar" />
      <el-table-column label="公告" align="center" prop="bulletin" />
      <el-table-column label="作者简介" align="center" prop="authorInfo" />
      <el-table-column label="作者头像" align="center" prop="authorAvatar" />
      <el-table-column label="关于我" align="center" prop="aboutMe" />
      <el-table-column label="是否开启音乐播放器" align="center" prop="isMusicPlayer" />
      <el-table-column label="是否显示公告  0 不显示 1显示" align="center" prop="showBulletin" />
      <el-table-column label="版权声明" align="center" prop="copyright" />
      <el-table-column label="发布时间" align="center" prop="releaseTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.releaseTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['blog:webConfig:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['blog:webConfig:remove']">删除</el-button>
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

    <!-- 添加或修改网站配置对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="webConfigRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="logo(文件UID)" prop="logo">
          <el-input v-model="form.logo" placeholder="请输入logo(文件UID)" />
        </el-form-item>
        <el-form-item label="网站名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入网站名称" />
        </el-form-item>
        <el-form-item label="介绍" prop="summary">
          <el-input v-model="form.summary" placeholder="请输入介绍" />
        </el-form-item>
        <el-form-item label="关键字" prop="keyword">
          <el-input v-model="form.keyword" placeholder="请输入关键字" />
        </el-form-item>
        <el-form-item label="作者" prop="author">
          <el-input v-model="form.author" placeholder="请输入作者" />
        </el-form-item>
        <el-form-item label="备案号" prop="recordNum">
          <el-input v-model="form.recordNum" placeholder="请输入备案号" />
        </el-form-item>
        <el-form-item label="网站地址" prop="webUrl">
          <el-input v-model="form.webUrl" placeholder="请输入网站地址" />
        </el-form-item>
        <el-form-item label="支付宝收款码FileId" prop="aliPay">
          <el-input v-model="form.aliPay" placeholder="请输入支付宝收款码FileId" />
        </el-form-item>
        <el-form-item label="微信收款码FileId" prop="weixinPay">
          <el-input v-model="form.weixinPay" placeholder="请输入微信收款码FileId" />
        </el-form-item>
        <el-form-item label="github地址" prop="github">
          <el-input v-model="form.github" placeholder="请输入github地址" />
        </el-form-item>
        <el-form-item label="gitee地址" prop="gitee">
          <el-input v-model="form.gitee" placeholder="请输入gitee地址" />
        </el-form-item>
        <el-form-item label="QQ号" prop="qqNumber">
          <el-input v-model="form.qqNumber" placeholder="请输入QQ号" />
        </el-form-item>
        <el-form-item label="QQ群" prop="qqGroup">
          <el-input v-model="form.qqGroup" placeholder="请输入QQ群" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="微信" prop="wechat">
          <el-input v-model="form.wechat" placeholder="请输入微信" />
        </el-form-item>
        <el-form-item label="显示的列表" prop="showList">
          <el-input v-model="form.showList" placeholder="请输入显示的列表" />
        </el-form-item>
        <el-form-item label="登录方式列表" prop="loginTypeList">
          <el-input v-model="form.loginTypeList" placeholder="请输入登录方式列表" />
        </el-form-item>
        <el-form-item label="是否开启评论(0:否 1:是)" prop="openComment">
          <el-input v-model="form.openComment" placeholder="请输入是否开启评论(0:否 1:是)" />
        </el-form-item>
        <el-form-item label="是否开启赞赏(0:否， 1:是)" prop="openAdmiration">
          <el-input v-model="form.openAdmiration" placeholder="请输入是否开启赞赏(0:否， 1:是)" />
        </el-form-item>
        <el-form-item label="游客头像" prop="touristAvatar">
          <el-input v-model="form.touristAvatar" placeholder="请输入游客头像" />
        </el-form-item>
        <el-form-item label="公告" prop="bulletin">
          <el-input v-model="form.bulletin" placeholder="请输入公告" />
        </el-form-item>
        <el-form-item label="作者简介" prop="authorInfo">
          <el-input v-model="form.authorInfo" placeholder="请输入作者简介" />
        </el-form-item>
        <el-form-item label="作者头像" prop="authorAvatar">
          <el-input v-model="form.authorAvatar" placeholder="请输入作者头像" />
        </el-form-item>
        <el-form-item label="关于我" prop="aboutMe">
          <el-input v-model="form.aboutMe" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="是否开启音乐播放器" prop="isMusicPlayer">
          <el-input v-model="form.isMusicPlayer" placeholder="请输入是否开启音乐播放器" />
        </el-form-item>
        <el-form-item label="是否显示公告  0 不显示 1显示" prop="showBulletin">
          <el-input v-model="form.showBulletin" placeholder="请输入是否显示公告  0 不显示 1显示" />
        </el-form-item>
        <el-form-item label="版权声明" prop="copyright">
          <el-input v-model="form.copyright" placeholder="请输入版权声明" />
        </el-form-item>
        <el-form-item label="发布时间" prop="releaseTime">
          <el-date-picker clearable
            v-model="form.releaseTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择发布时间">
          </el-date-picker>
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

<script setup name="WebConfig">
import { listWebConfig, getWebConfig, delWebConfig, addWebConfig, updateWebConfig } from "@/api/blog/webConfig";

const { proxy } = getCurrentInstance();

const webConfigList = ref([]);
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
    logo: null,
    name: null,
    summary: null,
    keyword: null,
    author: null,
    recordNum: null,
    webUrl: null,
    aliPay: null,
    weixinPay: null,
    github: null,
    gitee: null,
    qqNumber: null,
    qqGroup: null,
    email: null,
    wechat: null,
    showList: null,
    loginTypeList: null,
    openComment: null,
    openAdmiration: null,
    touristAvatar: null,
    bulletin: null,
    authorInfo: null,
    authorAvatar: null,
    aboutMe: null,
    isMusicPlayer: null,
    showBulletin: null,
    copyright: null,
    releaseTime: null,
  },
  rules: {
    logo: [
      { required: true, message: "logo(文件UID)不能为空", trigger: "blur" }
    ],
    name: [
      { required: true, message: "网站名称不能为空", trigger: "blur" }
    ],
    summary: [
      { required: true, message: "介绍不能为空", trigger: "blur" }
    ],
    keyword: [
      { required: true, message: "关键字不能为空", trigger: "blur" }
    ],
    author: [
      { required: true, message: "作者不能为空", trigger: "blur" }
    ],
    recordNum: [
      { required: true, message: "备案号不能为空", trigger: "blur" }
    ],
    openAdmiration: [
      { required: true, message: "是否开启赞赏(0:否， 1:是)不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询网站配置列表 */
function getList() {
  loading.value = true;
  listWebConfig(queryParams.value).then(response => {
    webConfigList.value = response.rows;
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
    logo: null,
    name: null,
    summary: null,
    keyword: null,
    author: null,
    recordNum: null,
    webUrl: null,
    aliPay: null,
    weixinPay: null,
    github: null,
    gitee: null,
    qqNumber: null,
    qqGroup: null,
    email: null,
    wechat: null,
    showList: null,
    loginTypeList: null,
    openComment: null,
    openAdmiration: null,
    touristAvatar: null,
    bulletin: null,
    authorInfo: null,
    authorAvatar: null,
    aboutMe: null,
    isMusicPlayer: null,
    showBulletin: null,
    copyright: null,
    releaseTime: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("webConfigRef");
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
  title.value = "添加网站配置";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getWebConfig(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改网站配置";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["webConfigRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateWebConfig(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addWebConfig(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除网站配置编号为"' + _ids + '"的数据项？').then(function() {
    return delWebConfig(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('blog/webConfig/export', {
    ...queryParams.value
  }, `webConfig_${new Date().getTime()}.xlsx`)
}

getList();
</script>
