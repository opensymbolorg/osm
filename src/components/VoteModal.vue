<template>
  <el-dialog v-if="token" :title="`Vote for ${token.name}`" :visible.sync="showModal">
    <el-row :gutter="30">
      <el-col :span="12">
        <el-card :body-style="{ padding: '0px' }">
          <div class="token-wrapper" style="padding: 40px 0">
            <span class="token-symbol">{{ token.symbol }}</span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <p>Votes: {{ token.votes }}</p>
      </el-col>
    </el-row>
    <el-form :model="form">
      <el-row :gutter="20">
        <el-col :span="18">
          <el-form-item>
            <el-input v-model="form.osm" auto-complete="off" readonly></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <span class="label">OSM</span>
        </el-col>
      </el-row>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button type="primary" @click="showModal = false">Submit Vote</el-button>
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
        osm: 1,
        name: '',
        votes: 0
      },
      token: null
    }
  },
  methods: {
    toggleModal (payload) {
      this.showModal = !this.showModal
      this.token = payload
    }
  },
  mounted () {
    EventBus.$on('toggleVoteModal', this.toggleModal)
  }
}
</script>

<style scoped>
.el-form {
  margin-top: 20px;
}

.el-form .label {
  line-height: 40px;
}
</style>
