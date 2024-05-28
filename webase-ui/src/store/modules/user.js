import { login, logout, getInfo, refreshToken } from '@/api/login'
import { getToken, setToken, setExpiresIn, removeToken } from '@/utils/auth'
import Cookies from 'js-cookie'

const user = {
  state: {
    token: getToken(),
    name: '',
    avatar: '',
    roles: [],
    permissions: []
  },

  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_EXPIRES_IN: (state, time) => {
      state.expires_in = time
    },
    SET_NAME: (state, name) => {
      state.name = name
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    SET_PERMISSIONS: (state, permissions) => {
      state.permissions = permissions
    }
  },

  actions: {
    // 登录
    Login({ commit }, userInfo) {
      const username = userInfo.username.trim()
      const password = userInfo.password
      const code = userInfo.code
      const uuid = userInfo.uuid
      return new Promise((resolve, reject) => {
        login(username, password, code, uuid).then(res => {
          let data = res.data
          localStorage.clear()
          setToken(data.access_token)
          commit('SET_TOKEN', data.access_token)
          setExpiresIn(data.expires_in)
          commit('SET_EXPIRES_IN', data.expires_in)
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 获取用户信息
    GetInfo({ commit, state }) {
      return new Promise((resolve, reject) => {
        getInfo().then(res => {
          const user = res.data.user
          const avatar = (user.avatar == "" || user.avatar == null) ? require("@/assets/images/profile.jpg") : user.avatar;
          localStorage.setItem('user', user.userName)
          /*
          Cookies.set('UserName', user.userName)
          Cookies.set('UserId', user.userId)
          if (user.dept) {
            Cookies.set('DeptId', user.deptId)
            Cookies.set('DeptName', user.dept.deptName)
          } else {
            Cookies.set('DeptId', -1)
            Cookies.set('DeptName', '')
          }
          */
          if (res.data.roles && res.data.roles.length > 0) { // 验证返回的roles是否是一个非空数组
            commit('SET_ROLES', res.data.roles)
            commit('SET_PERMISSIONS', res.data.permissions)
            if (res.data.roles.indexOf('admin') > -1 || res.data.roles.indexOf('chainAdmin') > -1) {
              localStorage.setItem('root', 'admin')
            } else if (res.data.roles.indexOf('dev') > -1) {
              localStorage.setItem('root', 'developer')
            } else {
              localStorage.setItem('root', 'visitor')
            }
          } else {
            commit('SET_ROLES', ['ROLE_DEFAULT'])
            localStorage.setItem('root', 'visitor')
          }
          commit('SET_NAME', user.userName)
          commit('SET_AVATAR', avatar)
          resolve(res)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 退出系统
    LogOut({ commit, state }) {
      return new Promise((resolve, reject) => {
        logout(state.token).then(() => {
          commit('SET_TOKEN', '')
          commit('SET_ROLES', [])
          commit('SET_PERMISSIONS', [])
          removeToken()
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 前端 登出
    FedLogOut({ commit }) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        resolve()
      })
    }
  }
}

export default user
