<template>
  <el-header>
    <el-menu class="el-menu" mode="horizontal">
      <el-menu-item index="1"><router-link to="/">OpenSymbol</router-link></el-menu-item>
      <el-menu-item index="2" class="right"><el-button type="primary" size="small" @click="toggleRegisterModal">Register</el-button></el-menu-item>
      <el-menu-item index="3" class="right"><a href="#">Standard</a></el-menu-item>
    </el-menu>
  </el-header>
</template>

<script>
import { EventBus } from '../../event-bus.js'

export default {
  methods: {
    toggleRegisterModal () {
      EventBus.$emit('toggleRegisterModal')
    }
  }
}
</script>
