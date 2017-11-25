import symbols from '../symbols.json'
import pay from '../pay.json'
import game from '../game.json'

export const fetchSymbols = ({ commit, state }, payload = {}) => {
  commit('setSymbols', { symbols })
}

export const fetchGame = ({ commit, state }, payload = {}) => {
  commit('setSymbol', { symbol: game })
}

export const fetchPay = ({ commit, state }, payload = {}) => {
  commit('setSymbol', { symbol: pay })
}
