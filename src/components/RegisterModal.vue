<template>
  <el-dialog title="Register New Token" :visible.sync="showModal">
    <el-form :model="form">
      <el-form-item>
        <el-select v-model="form.platform" placeholder="Blockchain">
          <el-option label="Blockchain" value="blockchain"></el-option>
          <el-option label="platform" value="platform"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-input v-model="form.id" auto-complete="off" placeholder="Project (Bitcoin Core)"></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="form.name" auto-complete="off" placeholder="Name (Bitcoin)"></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="form.symbol" auto-complete="off" placeholder="Symbol (BTC)"></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="form.decimals" auto-complete="off" placeholder="Decimals (8)"></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="form.address" auto-complete="off" placeholder="Address (0x)"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="showModal = false">Cancel</el-button>
      <el-button type="primary" @click="showModal = false">Confirm</el-button>
    </span>
  </el-dialog>
</template>

<script>
import { EventBus } from '../event-bus.js'

export default {
  data () {
    return {
      showModal: false,
      form: {
        platform: ''
      }
    }
  },
  methods: {
    toggleModal () {
      this.showModal = !this.showModal
    }
  },
  mounted () {
    EventBus.$on('toggleRegisterModal', this.toggleModal)
  }
}
</script>
