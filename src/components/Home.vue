<template>
  <el-container class="is-vertical">
    <app-header></app-header>
    <el-main class="home-view">
      <p class="intro">Blockchain Trading Symbol Standard & Registry</p>
      <el-row :gutter="20">
        <el-col :span="12" class="align-center"><el-button type="primary" size="small" @click="toggleRegisterModal">Register Symbol</el-button></el-col>
        <el-col :span="12" class="align-center"><el-button type="primary" size="small" @click="toggleTokenModal">Get Vote Token</el-button></el-col>
      </el-row>
      <section class="search">
        <el-input placeholder="Search symbol" v-model="input"></el-input>

        <div class="box">
          <h3>Registered</h3>
          <el-row :gutter=10>
            <el-col :span="12" v-for="(item, index) in registered" :key="item.symbol">
              <el-card :body-style="{ padding: '0px' }">
                <router-link :to="item.symbol" class="token-wrapper">
                  <p class="token-name">{{ item.name }}</p>
                  <p class="token-symbol">{{ item.symbol }}</p>
                  <p class="token-votes">{{ item.vote_total }}</p>
                  <el-row :gutter="10">
                    <el-col :span="12"><p class="token-status">{{ item.status }}</p></el-col>
                    <el-col :span="12"><p class="token-date">{{ registeredAt(item.registered_at) }}</p></el-col>
                  </el-row>
                </router-link>
              </el-card>
            </el-col>
          </el-row>
        </div>

        <div class="box">
          <h3>Voting</h3>
          <el-row :gutter=10>
            <el-col :span="12" v-for="(item, index) in voting" :key="item.symbol">
              <el-card :body-style="{ padding: '0px' }">
                <router-link :to="item.symbol" class="token-wrapper">
                  <p class="token-name">{{ item.name }}</p>
                  <p class="token-symbol">{{ item.symbol }}</p>
                  <p class="token-votes">{{ item.vote_total }}</p>
                  <el-row :gutter="2">
                    <el-col :span="12"><p class="token-status">End date:</p></el-col>
                    <el-col :span="12"><p class="token-date">{{ registeredAt(item.vote_end_at) }}</p></el-col>
                  </el-row>
                </router-link>
              </el-card>
            </el-col>
          </el-row>
        </div>
      </section>
      <token-modal></token-modal>
    </el-main>
    <app-footer></app-footer>
  </el-container>
</template>

<script>
import { mapGetters } from 'vuex'
import AppHeader from './layout/Header'
import AppFooter from './layout/Footer'
import TokenModal from './TokenModal.vue'
import { EventBus } from '../event-bus.js'

export default {
  name: 'home',
  components: {
    AppHeader,
    AppFooter,
    TokenModal
  },
  data () {
    return {
      input: ''
    }
  },
  computed: {
    ...mapGetters([
      'registered',
      'voting'
    ])
  },
  methods: {
    toggleRegisterModal () {
      EventBus.$emit('toggleRegisterModal')
    },
    toggleTokenModal () {
      EventBus.$emit('toggleTokenModal')
    },
    registeredAt (date) {
      if (date) return (new Date(date)).toLocaleDateString()
    }
  }
}
</script>
