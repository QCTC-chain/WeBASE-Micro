import request from "@/utils/request";

// 获取bcos2.9.0信息
export function bcos2Info() {
  return request({
    url: "/node-mgr/stat/chain",
    method: "get",
  });
}
// 获取bcos3.9.0信息
export function bcos3Info() {
  return request({
    url: "/node-mgr3/stat/chain",
    method: "get",
  });
}
// 获取chainmaker信息
export function chainmakerInfo() {
  return request({
    url: "/chainmaker",
    method: "post",
    params: { cmb: "GeneralData" },
    data: { ChainId: "" },
  });
}
