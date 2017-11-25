<template>
  <el-header>
    <el-menu class="el-menu" mode="horizontal">
      <el-menu-item index="1"><router-link to="/">OpenSymbol</router-link></el-menu-item>
      <el-menu-item index="2" class="right"><el-button type="primary" size="small" @click="toggleModal">Register</el-button></el-menu-item>
      <el-menu-item index="3" class="right"><a href="#">Standard</a></el-menu-item>
    </el-menu>
  </el-header>
</template>

<script>
import { EventBus } from '../../event-bus.js'

export default {
  methods: {
    toggleModal () {
      EventBus.$emit('toggleModal')
    }
  }
}
</script>

<style scoped>
.right {
  float: right;
}

.el-menu {
  border-bottom: none;
}

.el-menu-item {
  padding: 0;
  border-bottom: none;
}

.el-menu-item.right {
  padding: 0 5px;
}

.el-menu-item.is-active {
  border-bottom: none;
}
</style>
