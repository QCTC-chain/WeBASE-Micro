<template>
    <el-dialog title="提示" :visible.sync="modalShow" :before-close="handleClose" :show-close="true">
        <div class="tip">
            添加主机前，请确保将部署主机的公钥添加到远程主机的authorized_keys文件上
        </div>
        <div class="example">
            示例命令(进入docker容器执行)：ssh-copy-id -f -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa.pub root@host
        </div>
        <div>
            文件内容：{{ ssh }}
            <el-link :underline="false" icon="el-icon-document-copy" v-clipboard:copy="ssh"
                v-clipboard:success="copyTextSuccess" style="margin-left: 5px;"></el-link>
        </div>

        <template #footer>
            <span class="dialog-footer">
                <el-button type="primary" @click="handleClose">
                    确认
                </el-button>
            </span>
        </template>
    </el-dialog>
</template>

<script>
import { getSSH } from '@/api/host';

export default {
    name: 'AddWarnModal',
    props: {
        show: Boolean,
        default: false
    },
    data() {
        return {
            ssh: '',
            modalShow: false,
        }
    },
    mounted() {
        this.getSSHRSA();
    },
    watch: {
        // 监听 show 改变
        show() {
            this.modalShow = this.show
        },
    },
    methods: {
        async getSSHRSA() {
            const res = await getSSH();
            this.ssh = res.msg;
        },
        copyTextSuccess() {
            this.$message({
                message: '复制成功',
                type: 'success'
            });
        },

        handleClose() {
            this.$emit('warnClose');
        }
    }
}
</script> 

<style>
.tip {
    color: red;
    margin-bottom: 10px;
}

.example {
    margin-bottom: 10px;
}
</style>