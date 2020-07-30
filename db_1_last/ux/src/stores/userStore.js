const state = {
  user: undefined
}

const getters = {
  user: () => state.user
}

const mutations = {
  SET_USER (state, obj) {
    state.user = obj
  }
}

const actions = {
  setAuthUser ({ commit }, payload) {
    commit('SET_USER', payload)
  },
  destroyAuthUser ({ commit }) {
    commit('SET_AUTH_USER')
  }
}

export default {
  state,
  getters,
  mutations,
  actions
}
