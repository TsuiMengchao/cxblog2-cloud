<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分类id" prop="categoryId">
        <el-input
          v-model="queryParams.categoryId"
          placeholder="请输入分类id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入文章标题"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章封面地址" prop="avatar">
        <el-input
          v-model="queryParams.avatar"
          placeholder="请输入文章封面地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章简介" prop="summary">
        <el-input
          v-model="queryParams.summary"
          placeholder="请输入文章简介"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否置顶 0否 1是" prop="isStick">
        <el-input
          v-model="queryParams.isStick"
          placeholder="请输入是否置顶 0否 1是"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否发布 0：下架 1：发布" prop="isPublish">
        <el-input
          v-model="queryParams.isPublish"
          placeholder="请输入是否发布 0：下架 1：发布"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否原创  0：转载 1:原创" prop="isOriginal">
        <el-input
          v-model="queryParams.isOriginal"
          placeholder="请输入是否原创  0：转载 1:原创"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="转载地址" prop="originalUrl">
        <el-input
          v-model="queryParams.originalUrl"
          placeholder="请输入转载地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章阅读量" prop="quantity">
        <el-input
          v-model="queryParams.quantity"
          placeholder="请输入文章阅读量"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否首页轮播" prop="isCarousel">
        <el-input
          v-model="queryParams.isCarousel"
          placeholder="请输入是否首页轮播"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否推荐" prop="isRecommend">
        <el-input
          v-model="queryParams.isRecommend"
          placeholder="请输入是否推荐"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关键词" prop="keywords">
        <el-input
          v-model="queryParams.keywords"
          placeholder="请输入关键词"
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
          v-hasPermi="['blog:article:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:article:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:article:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:article:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="articleList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键id" align="center" prop="id" />
      <el-table-column label="用户id" align="center" prop="userId" />
      <el-table-column label="分类id" align="center" prop="categoryId" />
      <el-table-column label="文章标题" align="center" prop="title" />
      <el-table-column label="文章封面地址" align="center" prop="avatar" />
      <el-table-column label="文章简介" align="center" prop="summary" />
      <el-table-column label="文章内容 " align="center" prop="content" />
      <el-table-column label="文章内容md版" align="center" prop="contentMd" />
      <el-table-column label="阅读方式 0无需验证 1：评论阅读 2：点赞阅读 3：扫码阅读" align="center" prop="readType" />
      <el-table-column label="是否置顶 0否 1是" align="center" prop="isStick" />
      <el-table-column label="是否发布 0：下架 1：发布" align="center" prop="isPublish" />
      <el-table-column label="是否原创  0：转载 1:原创" align="center" prop="isOriginal" />
      <el-table-column label="转载地址" align="center" prop="originalUrl" />
      <el-table-column label="文章阅读量" align="center" prop="quantity" />
      <el-table-column label="是否首页轮播" align="center" prop="isCarousel" />
      <el-table-column label="是否推荐" align="center" prop="isRecommend" />
      <el-table-column label="关键词" align="center" prop="keywords" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['blog:article:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['blog:article:remove']">删除</el-button>
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

    <!-- 添加或修改博客文章对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="articleRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户id" />
        </el-form-item>
        <el-form-item label="分类id" prop="categoryId">
          <el-input v-model="form.categoryId" placeholder="请输入分类id" />
        </el-form-item>
        <el-form-item label="文章标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入文章标题" />
        </el-form-item>
        <el-form-item label="文章封面地址" prop="avatar">
          <el-input v-model="form.avatar" placeholder="请输入文章封面地址" />
        </el-form-item>
        <el-form-item label="文章简介" prop="summary">
          <el-input v-model="form.summary" placeholder="请输入文章简介" />
        </el-form-item>
        <el-form-item label="文章内容 ">
          <editor v-model="form.content" :min-height="192"/>
        </el-form-item>
        <el-form-item label="文章内容md版" prop="contentMd">
          <el-input v-model="form.contentMd" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="是否置顶 0否 1是" prop="isStick">
          <el-input v-model="form.isStick" placeholder="请输入是否置顶 0否 1是" />
        </el-form-item>
        <el-form-item label="是否发布 0：下架 1：发布" prop="isPublish">
          <el-input v-model="form.isPublish" placeholder="请输入是否发布 0：下架 1：发布" />
        </el-form-item>
        <el-form-item label="是否原创  0：转载 1:原创" prop="isOriginal">
          <el-input v-model="form.isOriginal" placeholder="请输入是否原创  0：转载 1:原创" />
        </el-form-item>
        <el-form-item label="转载地址" prop="originalUrl">
          <el-input v-model="form.originalUrl" placeholder="请输入转载地址" />
        </el-form-item>
        <el-form-item label="文章阅读量" prop="quantity">
          <el-input v-model="form.quantity" placeholder="请输入文章阅读量" />
        </el-form-item>
        <el-form-item label="是否首页轮播" prop="isCarousel">
          <el-input v-model="form.isCarousel" placeholder="请输入是否首页轮播" />
        </el-form-item>
        <el-form-item label="是否推荐" prop="isRecommend">
          <el-input v-model="form.isRecommend" placeholder="请输入是否推荐" />
        </el-form-item>
        <el-form-item label="关键词" prop="keywords">
          <el-input v-model="form.keywords" placeholder="请输入关键词" />
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

<script setup name="Article">
import { listArticle, getArticle, delArticle, addArticle, updateArticle } from "@/api/blog/article";

const { proxy } = getCurrentInstance();

const articleList = ref([]);
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
    userId: null,
    categoryId: null,
    title: null,
    avatar: null,
    summary: null,
    content: null,
    contentMd: null,
    readType: null,
    isStick: null,
    isPublish: null,
    isOriginal: null,
    originalUrl: null,
    quantity: null,
    isCarousel: null,
    isRecommend: null,
    keywords: null,
  },
  rules: {
    title: [
      { required: true, message: "文章标题不能为空", trigger: "blur" }
    ],
    summary: [
      { required: true, message: "文章简介不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询博客文章列表 */
function getList() {
  loading.value = true;
  listArticle(queryParams.value).then(response => {
    articleList.value = response.rows;
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
    userId: null,
    categoryId: null,
    title: null,
    avatar: null,
    summary: null,
    content: null,
    contentMd: null,
    readType: null,
    isStick: null,
    isPublish: null,
    isOriginal: null,
    originalUrl: null,
    quantity: null,
    isCarousel: null,
    isRecommend: null,
    keywords: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("articleRef");
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
  title.value = "添加博客文章";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getArticle(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改博客文章";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["articleRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateArticle(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addArticle(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除博客文章编号为"' + _ids + '"的数据项？').then(function() {
    return delArticle(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('blog/article/export', {
    ...queryParams.value
  }, `article_${new Date().getTime()}.xlsx`)
}

getList();
</script>
