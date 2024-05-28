import request from '@/utils/request'

// 查询主机资源列表
export function hostList() {
    return request({
        url: '/host-mgr/host/list',
        method: 'get',
    })
}

// 新增主机资源
export function addHost(data) {
    return request({
        url: '/host-mgr/host',
        method: 'post',
        data: data
    })
}
// 删除主机资源
export function deleteHost(ids) {
    return request({
        url: `/host-mgr/host/${ids}`,
        method: 'post',
    })
}

// 删除主机资源
export function getSSH() {
    return request({
        url: '/host-mgr/host/sshRsa',
        method: 'get',
    })
}