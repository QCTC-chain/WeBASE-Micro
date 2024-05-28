//import router from '@/router';

const apps = [
  /**
   * name: 微应用名称 - 具有唯一性
   * entry: 微应用入口 - 通过该地址加载微应用
   * container: 微应用挂载节点 - 微应用加载完成后将挂载在该节点上
   * activeRule: 微应用触发的路由规则 - 触发路由规则后将加载该微应用
   */

  {
    name: 'WeBASE-Web1',
    // entry: '//localhost:3005/',
    entry: '/child/bcos1/',
    container: '#micro-container',
    activeRule: '/bcos1',
  },
  {
    name: 'WeBASE-Web3',
    // entry: '//localhost:3006/',
    // entry: '//192.168.12.115/child/bcos3/',
    entry: '/child/bcos3/',
    container: '#micro-container',
    activeRule: '/bcos3',
    // props: {
    //   router: router
    // }
  },
  {
    name: 'chainmaker',
    // entry: '//localhost:3000/',
    entry: '/child/chainmaker/',
    container: '#micro-container',
    activeRule: '/cm',
  }
];
export default apps;

