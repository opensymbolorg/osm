<template>
  <el-dialog title="Buy Open Symbol Voting Token" :visible.sync="showModal">
    <el-form :model="form">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="ETH">
            <el-input v-model="form.eth" auto-complete="off"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="OSM">
            <el-input v-model="form.osm" auto-complete="off" readonly></el-input>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button type="primary" @click="showModal = false">{{ form.eth === 0 ? 'Redeem Free Token' : 'Purchase Token' }}</el-button>
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
        eth: 0,
        osm: 1
      }
    }
  },
  methods: {
    toggleModal () {
      this.showModal = !this.showModal
    }
  },
  mounted () {
    EventBus.$on('toggleTokenModal', this.toggleModal)
  },
  watch: {
    'form.eth': function (newValue) {
      let value = parseFloat(newValue)
      console.log(value)

      switch (true) {
        case (value >= 100):
          this.form.osm = value * 10
          break
        case (value >= 10):
          this.form.osm = value * 100
          break
        case (value > 1):
          this.form.osm = value * 1000
          break
        case (value >= 0):
          this.form.osm = value * 10000
          break
        case isNaN(value) || value < 0:
          this.form.osm = 0
          break
      }
    }
  }
}
</script>
