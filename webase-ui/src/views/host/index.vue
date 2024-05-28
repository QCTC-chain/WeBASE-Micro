<template>
    <div class="main">
        <div class="op-part">
            <div class="btns">
                <el-button type="primary" plain icon="el-icon-plus" @click="openAdd()" v-hasPermi="['host:add']">添加主机</el-button>
            </div>
        </div>
        <el-table :data="tableData" style="width: 100%">
            <el-table-column prop="ip" label="IP" align="center" />
            <el-table-column prop="port" label="端口" align="center" />
            <el-table-column prop="user" label="用户" align="center" />
            <el-table-column prop="rootDir" label="安装目录" align="center" />
            <el-table-column label="操作" align="center">
                <template #default="{ row }">
                    <el-button link type="primary" size="small" @click="deleteModal(row)" v-hasPermi="['host:delete']">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <AddModal :show="showAdd" :title="'添加主机'" @close="handleClose" @getHostList="getList" />
        <AddWarnModal :show="showAddWarn" @warnClose='addWarnClose' />
    </div>
</template>

<script>
import AddModal from "./addModal.vue";
import AddWarnModal from "./addWarnModal.vue";
import { hostList, deleteHost } from '@/api/host/index';

export default {
    name: 'Host',
    data() {
        return {
            tableData: [],
            showAdd: false,
            showAddWarn: false
        }
    },
    components: {
        AddModal,
        AddWarnModal
    },
    mounted() {
        this.getList();
    },
    methods: {
        async getList() {
            const { rows } = await hostList();
            this.tableData = rows
        },
        async deleteHostByIds(ids) {
            const res = await deleteHost(ids);
            if (res.code !== 200) return;
        },
        openAdd() {
            this.showAddWarn = true;
        },
        addWarnClose() {
            this.showAddWarn = false;
            this.showAdd = true;
        },
        handleClose() {
            this.showAdd = false;
        },
        deleteModal(row) {
            this.$confirm(
                "是否删除该主机?",
                "提示",
                {
                    confirmButtonText: "确认",
                    cancelButtonText: "取消",
                    type: "warning",
                }
            )
                .then(async () => {
                    row.id && await this.deleteHostByIds([row.id]);
                    this.$message({
                        type: "success",
                        message: "删除成功",
                    });
                    await this.getList();
                })
                .catch(() => {
                    this.$message({
                        type: "info",
                        message: "取消删除",
                    });
                });
        }
    }
}


</script>

<style>
.main {
    padding: 20px;
}

.op-part {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
}

.btns {
    flex: 1;
}

.input {
    width: 40%;
}
</style>
