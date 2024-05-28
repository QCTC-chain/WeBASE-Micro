<template>
  <div class="app-container home">
    <el-row :gutter="24">
      <el-col :span="24" v-for="list in chainList">
        <el-card>
          <el-row :gutter="24">
            <br /><br />
            <el-col :span="12" v-for="item in list.info">
              <el-row :gutter="24" type="flex" justify="center" align="middle">
                <el-col :sm="12" :lg="10">
                  <div :class="['icon-box', list.bgClass]">
                    <img :src="require('../assets/images/' + item.icon)" />
                  </div>
                </el-col>
                <el-col :sm="12" :lg="14" style="padding-left: 0px">
                  <div class="num">{{ item.num }}</div>
                  <div class="text">{{ item.text }}</div>
                </el-col>
              </el-row>
              <br /><br /><br />
            </el-col>
          </el-row>
          <!-- </div> -->
          <div class="intro">
            <div class="name">
              <img :src="require('../assets/images/' + list.logo)" />
              <div class="text bold">{{ list.name }}</div>
            </div>
            <ul>
              <li v-for="v in list.intro">
                <span class="bold">{{ v.title }}: </span>
                <span>{{ v.text }}</span>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <br /><br />
    <el-row :gutter="24">
      <el-col :span="12" v-for="(list, index) in infoList" :key="index">
        <div class="card">
          <div class="title bold">
            {{ list.title }}
          </div>
          <div class="card-content" v-if="list.list.length > 0">
            <div>
              <el-row
                :gutter="24"
                type="flex"
                justify="space-between"
                align="middle"
                class="info"
                v-for="item in list.list"
                @click.native="handleDetail(item)"
              >
                <el-col :md="12" :lg="16" :xl="18">
                  <div class="notice-title">
                    {{ item.noticeTitle }}
                  </div>
                </el-col>
                <el-col :md="12" :lg="8" :xl="6">
                  <div class="time">{{ item.createTime }}</div>
                </el-col>
              </el-row>
            </div>
            <pagination
              v-show="list.total > 0"
              :total="list.total"
              :page.sync="list.queryParams.pageNum"
              :limit.sync="list.queryParams.pageSize"
              :pageSizes="[5]"
              @pagination="onPagination(index, list.queryParams.noticeType)"
            />
          </div>
          <div class="card-content center" v-else>暂无数据</div>
        </div>
      </el-col>
    </el-row>

    <el-dialog
      :title="noticeInfo.noticeTitle"
      :visible.sync="dialogVisible"
      width="80%"
      center
    >
      <div v-html="noticeInfo.noticeContent"></div>
      <span slot="footer" class="dialog-footer">
        <!-- <el-button @click="dialogVisible = false">取 消</el-button> -->
        <el-button type="primary" @click="dialogVisible = false"
          >确 定</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { bcos2Info, bcos3Info, chainmakerInfo } from "@/api/index";
import { listNotice } from "@/api/system/notice";

export default {
  name: "Index",
  data() {
    return {
      chainList: [
        // {
        //   info: [
        //     {
        //       icon: "node.png",
        //       text: "节点",
        //       num: "",
        //     },
        //     {
        //       icon: "contracts.png",
        //       text: "智能合约",
        //       num: "",
        //     },
        //     {
        //       icon: "chain.png",
        //       text: "链",
        //       num: "",
        //     },
        //     {
        //       icon: "trade.png",
        //       text: "交易",
        //       num: "",
        //     },
        //   ],
        //   bgClass: "cm-bg",
        //   logo: "chainmaker.png",
        //   name: "长安链 2.3.1",
        //   intro: [
        //     {
        //       title: "支持版本",
        //       text: "国密版和非国密",
        //     },
        //     {
        //       title: "共识算法",
        //       text: "PBFT、TBFT、POW 实用拜占庭容错算法(Raft)、共识可插拔",
        //     },
        //     {
        //       title: "智能合约",
        //       text: "Solidity、go、wasm",
        //     },
        //   ],
        // },
        // {
        //   info: [
        //     {
        //       icon: "group.png",
        //       text: "群组",
        //       num: "",
        //     },
        //     {
        //       icon: "contracts.png",
        //       text: "智能合约",
        //       num: "",
        //     },
        //     {
        //       icon: "node.png",
        //       text: "节点",
        //       num: "",
        //     },
        //     {
        //       icon: "trade.png",
        //       text: "交易",
        //       num: "",
        //     },
        //   ],
        //   bgClass: "bcos2-bg",
        //   logo: "bcos.png",
        //   name: "Bcos 2.9.1",
        //   intro: [
        //     {
        //       title: "支持版本",
        //       text: "国密版",
        //     },
        //     {
        //       title: "共识算法",
        //       text: "PBFT、实用拜占庭容错算法(Raft)、共识可插拔",
        //     },
        //     {
        //       title: "智能合约",
        //       text: "Solidity、预编译合约",
        //     },
        //   ],
        // },
        {
          info: [
            {
              icon: "chain.png",
              text: "链",
              num: "",
            },
            {
              icon: "contracts.png",
              text: "智能合约",
              num: "",
            },
            {
              icon: "node.png",
              text: "节点",
              num: "",
            },
            {
              icon: "trade.png",
              text: "交易",
              num: "",
            },
          ],
          bgClass: "bcos3-bg",
          logo: "bcos.png",
          name: "Bcos 3.4.0",
          intro: [
            {
              title: "支持版本",
              text: "国密版",
            },
            {
              title: "共识算法",
              text: "PBFT、实用拜占庭容错算法(Raft)、共识可插拔",
            },
            {
              title: "智能合约",
              text: "Solidity、预编译合约、WBC-Liquid",
            },
          ],
        },
      ],
      infoList: [
        {
          title: "通知公告",
          list: [],
          total: 0,
          queryParams: {
            pageNum: 1,
            pageSize: 10,
            noticeType: 1,
          },
        },
        {
          title: "问题帮助",
          list: [],
          total: 0,
          queryParams: {
            pageNum: 1,
            pageSize: 10,
            noticeType: 2,
          },
        },
      ],
      dialogVisible: false,
      noticeInfo: "",
    };
  },
  mounted() {
    // this.getBcos2Info();
    this.getBcos3Info();
    // this.getChainmakerInfo();
    this.infoList.forEach((list, index) => {
      this.onPagination(index, list.queryParams.noticeType);
    });
  },
  methods: {
    async getChainmakerInfo() {
      const {
        Response: { Data },
      } = await chainmakerInfo();
      const info = this.chainList[0].info;
      info[0].num = Data.NodeNum;
      info[1].num = Data.ContractNum;
      info[2].num = Data.ChainNum;
      info[3].num = Data.TxNum;
    },
    async getBcos2Info() {
      const { data } = await bcos2Info();
      const info = this.chainList[1].info;
      info[0].num = data.groupCount;
      info[1].num = data.contractCount;
      info[2].num = data.nodeCount;
      info[3].num = data.transCount;
    },
    async getBcos3Info() {
      const { data } = await bcos3Info();
      const info = this.chainList[0].info;
      info[0].num = data.groupCount;
      info[1].num = data.contractCount;
      info[2].num = data.nodeCount;
      info[3].num = data.transCount;
    },
    async getList(queryParams, list) {
      try {
        const response = await listNotice(queryParams);
        list.list = response.rows;
        list.total = response.total;
      } catch (error) {
        console.error(error);
      }
    },
    async onPagination(listIndex, noticeType) {
      const list = this.infoList[listIndex];
      const queryParams = list.queryParams;
      queryParams.noticeType = noticeType;
      await this.getList(queryParams, list);
    },

    handleDetail(item) {
      this.dialogVisible = true;
      this.noticeInfo = item;
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  .cm-bg {
    background: linear-gradient(to top right, #7fdfff, #86a6ff);
  }

  .bcos2-bg {
    background: linear-gradient(to top right, #7ffcd6, #80abfe);
  }

  .bcos3-bg {
    background: linear-gradient(to top right, #cd98ef, #95b2e9);
  }

  .icon-box {
    width: 48px;
    height: 48px;
    display: flex;

    img {
      width: 28px;
      height: 28px;
      margin: auto;
    }
  }

  .num {
    color: #131313;
    font-size: 26px;
    font-weight: bold;
  }

  .intro {
    border: 1px solid #ebeced;
    border-radius: 10px;
    box-shadow: 0px 0px 20px 4px #ebeced;
    padding: 8%;
    display: flex;
    gap: 12%;
    height: 180px;

    .name {
      flex-shrink: 0;
      height: 160px;
      width: 90px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;

      .text {
        color: #040404;
        font-size: 14px;
        line-height: 48px;
      }
    }

    ul {
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      li {
        font-size: 14px;
        color: #000;
        margin-bottom: 10px;
      }

      li::marker {
        font-size: 20px;
      }
    }
  }

  .bold {
    font-weight: bold;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  .card {
    border-radius: 4px;
    border: 1px solid #e6ebf5;
    background-color: #ffffff;
    overflow: hidden;
    color: #303133;
    -webkit-transition: 0.3s;
    transition: 0.3s;
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  }

  .card-content {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 400px;
  }

  .notice-title {
    max-width: 500px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .center {
    justify-content: center;
    align-items: center;
  }
  .title {
    height: 40px;
    background-color: rgb(33, 115, 255, 0.5);
    color: #fff;
    line-height: 40px;
    padding-left: 30px;
    text-align: justify;
  }

  .info {
    border-bottom: 1px solid #ccc;
    line-height: 60px;
    margin: 0 18px !important;
    cursor: pointer;

    &:last-child() {
      border-bottom: none;
    }
  }

  .time {
    color: #7e7e7e;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  overflow-x: hidden;
}

.el-message-box {
  width: 60%;
}
</style>
