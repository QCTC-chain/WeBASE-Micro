import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

/* Layout */
import Layout from "@/layout";

/**
 * Note: 路由配置项
 *
 * hidden: true                     // 当设置 true 的时候该路由不会再侧边栏出现 如401，login等页面，或者如一些编辑页面/edit/1
 * alwaysShow: true                 // 当你一个路由下面的 children 声明的路由大于1个时，自动会变成嵌套的模式--如组件页面
 *                                  // 只有一个时，会将那个子路由当做根路由显示在侧边栏--如引导页面
 *                                  // 若你想不管路由下面的 children 声明的个数都显示你的根路由
 *                                  // 你可以设置 alwaysShow: true，这样它就会忽略之前定义的规则，一直显示根路由
 * redirect: noRedirect             // 当设置 noRedirect 的时候该路由在面包屑导航中不可被点击
 * name:'router-name'               // 设定路由的名字，一定要填写不然使用<keep-alive>时会出现各种问题
 * query: '{"id": 1, "name": "ry"}' // 访问路由的默认传递参数
 * roles: ['admin', 'common']       // 访问路由的角色权限
 * permissions: ['a:a:a', 'b:b:b']  // 访问路由的菜单权限
 * meta : {
    noCache: true                   // 如果设置为true，则不会被 <keep-alive> 缓存(默认 false)
    title: 'title'                  // 设置该路由在侧边栏和面包屑中展示的名字
    icon: 'svg-name'                // 设置该路由的图标，对应路径src/assets/icons/svg
    breadcrumb: false               // 如果设置为false，则不会在breadcrumb面包屑中显示
    activeMenu: '/system/user'      // 当路由设置了该属性，则会高亮相对应的侧边栏。
  }
 */

// 公共路由
export const constantRoutes = [
  {
    path: "/redirect",
    component: Layout,
    hidden: true,
    children: [
      {
        path: "/redirect/:path(.*)",
        component: () => import("@/views/redirect"),
      },
    ],
  },
  {
    path: "/login",
    component: () => import("@/views/login"),
    hidden: true,
  },
  {
    path: "/register",
    component: () => import("@/views/register"),
    hidden: true,
  },
  {
    path: "/404",
    component: () => import("@/views/error/404"),
    hidden: true,
  },
  {
    path: "/401",
    component: () => import("@/views/error/401"),
    hidden: true,
  },
  {
    path: "",
    component: Layout,
    redirect: "index",
    children: [
      {
        path: "index",
        component: () => import("@/views/index"),
        name: "Index",
        meta: { title: "首页", icon: "dashboard", affix: true },
      },
    ],
  },
  {
    path: "/user",
    component: Layout,
    hidden: true,
    redirect: "noredirect",
    children: [
      {
        path: "profile",
        component: () => import("@/views/system/user/profile/index"),
        name: "Profile",
        meta: { title: "个人中心", icon: "user" },
      },
    ],
  },
];

// 动态路由，基于用户权限动态去加载
export const dynamicRoutes = [
  {
    path: "/bcos1",
    component: Layout,
    hidden: true,
    permissions: ["bcos:home"],
    children: [
      {
        path: "blockInfo",
        component: () => import("@/views/blank"),
        name: "bcos1BlockInfo",
        meta: { title: "区块信息", activeMenu: "/bcos1/home" },
      },
      {
        path: "transactionInfo",
        component: () => import("@/views/blank"),
        name: "bcos1TransInfo",
        meta: { title: "交易信息", activeMenu: "/bcos1/home" },
      },
    ],
  },
  {
    path: "/bcos1",
    component: Layout,
    hidden: true,
    permissions: ["bcos:contract:List"],
    children: [
      {
        path: "parseAbi",
        component: () => import("@/views/blank"),
        name: "bcos1ParseAbi",
        meta: { title: "解析Abi", activeMenu: "/bcos1/contract/List" },
      },
      {
        path: "toolsContract",
        component: () => import("@/views/blank"),
        name: "bcos1ToolsContract",
        meta: { title: "合约预览", activeMenu: "/bcos1/contract/Warehouse" },
      },
    ],
  },
  {
    path: "/bcos1",
    component: Layout,
    hidden: true,
    permissions: ["bcos:chain:front"],
    children: [
      {
        path: "newNode",
        component: () => import("@/views/blank"),
        name: "bcos1NodeList",
        meta: { title: "节点管理", activeMenu: "/bcos1/front" },
      },
      {
        path: "node/chain",
        component: () => import("@/views/blank"),
        name: "bcos1NewChain",
        meta: { title: "新建区块链", activeMenu: "/bcos1/front" },
      },
      {
        path: "node/node",
        component: () => import("@/views/blank"),
        name: "bcos1NewNode",
        meta: { title: "新增节点", activeMenu: "/bcos1/front" },
      },
      {
        path: "hostDetail",
        component: () => import("@/views/blank"),
        name: "bcos1HostDetail",
        meta: { title: "节点详情", activeMenu: "/bcos1/front" },
      },
    ],
  },

  {
    path: "/bcos3",
    component: Layout,
    hidden: true,
    permissions: ["bcos3:home"],
    children: [
      {
        path: "blockInfo",
        component: () => import("@/views/blank"),
        name: "bcos3BlockInfo",
        meta: { title: "区块信息", activeMenu: "/bcos3/home" },
      },
      {
        path: "transactionInfo",
        component: () => import("@/views/blank"),
        name: "bcos3TransInfo",
        meta: { title: "交易信息", activeMenu: "/bcos3/home" },
      },
    ],
  },
  {
    path: "/bcos3",
    component: Layout,
    hidden: true,
    permissions: ["bcos3:contract:List"],
    children: [
      {
        path: "contract/parseAbi",
        component: () => import("@/views/blank"),
        name: "bcos3ParseAbi",
        meta: { title: "解析Abi", activeMenu: "/bcos3/contract/List" },
      },
      {
        path: "toolsContract",
        component: () => import("@/views/blank"),
        name: "bcos3ToolsContract",
        meta: { title: "合约预览", activeMenu: "/bcos3/contract/Warehouse" },
      },
    ],
  },
  {
    path: "/bcos3",
    component: Layout,
    hidden: true,
    permissions: ["bcos3:chain:front"],
    children: [
      {
        path: "newNode",
        component: () => import("@/views/blank"),
        name: "bcos3NodeList",
        meta: { title: "节点管理", activeMenu: "/bcos3/front" },
      },
      {
        path: "node/chain",
        component: () => import("@/views/blank"),
        name: "bcos3NewChain",
        meta: { title: "新建区块链", activeMenu: "/bcos3/chain" },
      },
      {
        path: "node/node",
        component: () => import("@/views/blank"),
        name: "bcos3NewNode",
        meta: { title: "新增节点", activeMenu: "/bcos3/front" },
      },
      {
        path: "hostDetail",
        component: () => import("@/views/blank"),
        name: "bcos3HostDetail",
        meta: { title: "节点详情", activeMenu: "/bcos3/front" },
      },
    ],
  },

  {
    path: "/cm",
    component: Layout,
    hidden: true,
    permissions: ["cm:chains"],
    children: [
      {
        path: "chains/new",
        component: () => import("@/views/blank"),
        name: "newCmChain",
        meta: { title: "新建区块链", activeMenu: "/cm/chains/new" },
      },
    ],
  },
  {
    path: "/cm",
    component: Layout,
    hidden: true,
    permissions: ["cm:chains:subscribe"],
    children: [
      {
        path: "chains/subscribe",
        component: () => import("@/views/blank"),
        name: "subCmChain",
        meta: { title: "订阅链", activeMenu: "/cm/chains/subscribe" },
      },
    ],
  },
  {
    path: "/cm",
    component: Layout,
    hidden: true,
    permissions: ["cm:chains:auth"],
    children: [
      {
        path: "overview/auth",
        component: () => import("@/views/blank"),
        name: "overviewAuth",
        meta: { title: "链权限管理", activeMenu: "/cm/overview" },
      },
    ],
  },
  {
    path: "/cm",
    component: Layout,
    hidden: true,
    permissions: ["cm:nodes"],
    children: [
      {
        path: "nodes/details/:id",
        component: () => import("@/views/blank"),
        name: "nodeDetails",
        meta: { title: "节点详情", activeMenu: "/cm/nodes" },
      },
    ],
  },
  {
    path: "/cm",
    component: Layout,
    hidden: true,
    permissions: ["cm:overview"],
    children: [
      {
        path: "overview/details",
        component: () => import("@/views/blank"),
        name: "browserDetails",
        meta: { title: "区块链浏览器-详情", activeMenu: "/cm/overview" },
      },
    ],
  },
  {
    path: "/cm",
    component: Layout,
    hidden: true,
    permissions: ["cm:contracts"],
    children: [
      {
        path: "contracts/details/:id",
        component: () => import("@/views/blank"),
        name: "contractDetails",
        meta: { title: "合约详情", activeMenu: "/cm/contracts" },
      },
    ],
  },
  {
    path: "/cm",
    component: Layout,
    hidden: true,
    permissions: ["cm:invoke:list"],
    children: [
      {
        path: "invoke-contracts/details",
        component: () => import("@/views/blank"),
        name: "browserDetails",
        meta: {
          title: "区块链浏览器-详情",
          activeMenu: "/cm/invoke-contracts",
        },
      },
    ],
  },

  {
    path: "/cm",
    component: Layout,
    hidden: true,
    permissions: ["cm:votes"],
    children: [
      {
        path: "votes/:id",
        component: () => import("@/views/blank"),
        name: "voteDetails",
        meta: { title: "投票详情", activeMenu: "/cm/votes" },
      },
    ],
  },

  {
    path: "/system/user-auth",
    component: Layout,
    hidden: true,
    permissions: ["system:user:edit"],
    children: [
      {
        path: "role/:userId(\\d+)",
        component: () => import("@/views/system/user/authRole"),
        name: "AuthRole",
        meta: { title: "分配角色", activeMenu: "/system/user" },
      },
    ],
  },
  {
    path: "/system/role-auth",
    component: Layout,
    hidden: true,
    permissions: ["system:role:edit"],
    children: [
      {
        path: "user/:roleId(\\d+)",
        component: () => import("@/views/system/role/authUser"),
        name: "AuthUser",
        meta: { title: "分配用户", activeMenu: "/system/role" },
      },
    ],
  },
  {
    path: "/system/dict-data",
    component: Layout,
    hidden: true,
    permissions: ["system:dict:list"],
    children: [
      {
        path: "index/:dictId(\\d+)",
        component: () => import("@/views/system/dict/data"),
        name: "Data",
        meta: { title: "字典数据", activeMenu: "/system/dict" },
      },
    ],
  },
  {
    path: "/system/oss-config",
    component: Layout,
    hidden: true,
    permissions: ["system:oss:list"],
    children: [
      {
        path: "index",
        component: () => import("@/views/system/oss/config"),
        name: "OssConfig",
        meta: { title: "配置管理", activeMenu: "/system/oss" },
      },
    ],
  },
  {
    path: "/tool/gen-edit",
    component: Layout,
    hidden: true,
    permissions: ["tool:gen:edit"],
    children: [
      {
        path: "index/:tableId(\\d+)",
        component: () => import("@/views/tool/gen/editTable"),
        name: "GenEdit",
        meta: { title: "修改生成配置", activeMenu: "/tool/gen" },
      },
    ],
  },
];

// 防止连续点击多次路由报错
let routerPush = Router.prototype.push;
let routerReplace = Router.prototype.replace;
// push
Router.prototype.push = function push(location) {
  return routerPush.call(this, location).catch((err) => err);
};
// replace
Router.prototype.replace = function push(location) {
  return routerReplace.call(this, location).catch((err) => err);
};

export default new Router({
  base: process.env.VUE_APP_CONTEXT_PATH,
  mode: "history", // 去掉url中的#
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes,
});
