<template>
    <el-dialog :title="modalTitle" :visible.sync="modalShow" :before-close="handleClose" :show-close="true">
        <el-form ref="formRef" :model="form" :rule="rules" label-width="100px">
            <el-form-item label="IP" prop="ip">
                <el-input v-model="form.ip" autocomplete="off" placeholder="请输入IP" />
            </el-form-item>
            <el-form-item label="端口" prop="port">
                <el-input v-model="form.port" autocomplete="off" placeholder="请输入端口" />
            </el-form-item>
            <el-form-item label="用户" prop="user">
                <el-input v-model="form.user" autocomplete="off" placeholder="请输入远程登录用户" />
            </el-form-item>
            <el-form-item label="安装目录" prop="rootDir">
                <el-input v-model="form.rootDir" autocomplete="off" placeholder="请选择安装目录" />
            </el-form-item>
        </el-form>
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="handleClose">
                    取消
                </el-button>
                <el-button type="primary" @click="handleSubmit('formRef')">
                    确认
                </el-button>
            </span>
        </template>
    </el-dialog>
</template>
  
<script>
import { addHost } from '@/api/host';

export default {
    name: 'AddModal',
    props: {
        show: {
            type: Boolean,
            default: false
        },
        title: {
            type: String,
            defalut: ''
        }
    },
    data() {
        return {
            modalShow: false,
            modalTitle: this.title,
            form: {
                ip: "",
                port: "22",
                user: "",
                rootDir: "/home/opt"
            },
            rules: {
                ip: [
                    { required: true, message: '请输入IP', trigger: 'blur' },
                    { pattern: /((25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))/, message: 'IP格式不正确', trigger: 'blur' }
                ],
                user: [
                    { required: true, message: '不能为空', trigger: 'blur' },
                ],
                port: [
                    { required: true, message: '不能为空', trigger: 'blur' },
                    { pattern: /([1-9]|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])/, message: '端口请输入1-65535之内的数字', trigger: 'blur' }
                ],
                rootDir: [
                    { required: true, message: '不能为空', trigger: 'blur' },
                    { pattern: /^\//, message: '安装目录需以"/"开头', trigger: 'blur' }
                ]
            }
        }
    },
    watch: {
        show() {
            this.modalShow = this.show;
        }
    },

    methods: {
        handleClose() {
            this.$emit('close');
        },

        handleSubmit(formName) {
            this.$refs[formName].validate(async (valid) => {
                if (!valid) {
                    return;
                }
                const data = { ...this.form, status: 0 };
                const res = await addHost(data);
                if (res.code !== 200) {
                    this.$message.error('添加主机失败！')
                    return;
                }

                this.$emit('close');
                this.$emit('getHostList');
            });
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