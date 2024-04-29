import request from '@/utils/request'

// 查询系统配置列表
export function listSystemConfig(query) {
  return request({
    url: '/blog/systemConfig/list',
    method: 'get',
    params: query
  })
}

// 查询系统配置详细
export function getSystemConfig(id) {
  return request({
    url: '/blog/systemConfig/' + id,
    method: 'get'
  })
}

// 新增系统配置
export function addSystemConfig(data) {
  return request({
    url: '/blog/systemConfig',
    method: 'post',
    data: data
  })
}

// 修改系统配置
export function updateSystemConfig(data) {
  return request({
    url: '/blog/systemConfig',
    method: 'put',
    data: data
  })
}

// 删除系统配置
export function delSystemConfig(id) {
  return request({
    url: '/blog/systemConfig/' + id,
    method: 'delete'
  })
}
