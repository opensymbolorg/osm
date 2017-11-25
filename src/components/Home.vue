<template>
  <el-container class="is-vertical">
    <app-header></app-header>
    <el-main>
      <p class="intro">Sit aut suscipit in iure blanditiis sed accusantium ex ipsam?</p>
      <el-row :gutter="20">
        <el-col :span="12" class="align-center"><el-button type="primary" size="small">Register Symbol</el-button></el-col>
        <el-col :span="12" class="align-center"><el-button type="primary" size="small">Get Vote Token</el-button></el-col>
      </el-row>
      <section class="search">
        <el-input placeholder="Search symbol" v-model="input"></el-input>

        <div class="box">
          <h3>Registered</h3>
          <el-row :gutter=10>
            <el-col :span="8" v-for="(o, index) in registerd" :key="o">
              <el-card :body-style="{ padding: '0px' }">
                <div class="coin-wrapper">
                  <span class="coin-name">{{ o }}</span>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </div>

        <div class="box">
          <h3>Voting</h3>
          <el-row :gutter=10>
            <el-col :span="8" v-for="(o, index) in voting" :key="o">
              <el-card :body-style="{ padding: '0px' }">
                <div class="coin-wrapper">
                  <span class="coin-name">{{ o }}</span>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </div>
      </section>
    </el-main>
    <app-footer></app-footer>
  </el-container>
</template>

<script>
  import AppHeader from './layout/Header'
  import AppFooter from './layout/Footer'

  export default {
    name: 'home',
    components: {
      AppHeader,
      AppFooter
    },
    data () {
      return {
        input: '',
        registerd: ['game', 'pay', 'btcusd'],
        voting: ['usd', 'aud', 'gold']
      }
    }
  }
</script>

<style scoped>
#app > .el-container {
  min-height: 100vh;
}

.el-main {
  padding-top: 0;
}

.intro {
  margin-top: 0;
}

.align-center {
  text-align: center;
}

section.search {
  margin: 20px 0;
}

.coin-wrapper {
  padding: 20px 0;
  text-align: center;
}

.coin-name {
  text-transform: uppercase;
  font-size: 16px;
}

.el-card {
  margin-bottom: 20px;
}
</style>
