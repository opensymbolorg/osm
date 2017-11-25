export const registered = state => state.symbols.filter(item => item.status === 'registered')
export const voting = state => state.symbols.filter(item => item.status === 'voting')
