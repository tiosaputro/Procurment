<template>
  <div class="container py-4">
    <div class="col-md-10">
        <Toast />
        <div class="card">
        <Toolbar class="p-mb-4">
          <template #start>
            <div class="p-grid p-dir-col">
			        <div class="p-col">
				        <h4>EMP BENTU (My RFS)</h4>
			        </div>
            </div>
          </template>
        </Toolbar>
            <div class="card-body">
             <form @submit.prevent="CreateDetail">
               <div class="p-fluid">
                 <div class="p-field p-grid">
                    <label for="tipe" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0" style="width:120px">Current Process</label>
                        <div class="p-col-3">
                            <Textarea
                                v-model="detail.rfs_current"
                                :autoResize="true"
                                placeholder="Masukan Current Process"
                                autofocus
                                :class="{ 'p-invalid': errors.rfs_current }"
                            />
                            <small v-if="errors.rfs_current" class="p-error">
                                {{ errors.rfs_current[0] }}
                            </small>
                        </div>
                 </div>
              </div>
              <div class="p-fluid">
                 <div class="p-field p-grid">
                    <label for="tipe" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0" style="width:120px">Remarks</label>
                        <div class="p-col-3">
                            <Textarea
                                v-model="detail.rfs_remark"
                                :autoResize="true"
                                placeholder="Masukan Remarks"
                                autofocus
                                :class="{ 'p-invalid': errors.rfs_remark }"
                            />
                            <small v-if="errors.rfs_remark" class="p-error">
                                {{ errors.rfs_remark[0] }}
                            </small>
                        </div>
                 </div>
              </div>
              <div class="p-fluid">
                 <div class="p-field p-grid">
                    <label for="tipe" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0" style="width:120px">Next Process</label>
                        <div class="p-col-3">
                            <Textarea
                                v-model="detail.rfs_next"
                                :autoResize="true"
                                placeholder="Masukan Next Process"
                                autofocus
                                :class="{ 'p-invalid': errors.rfs_next }"
                            />
                            <small v-if="errors.rfs_next" class="p-error">
                                {{ errors.rfs_next[0] }}
                            </small>
                        </div>
                 </div>
              </div>
              <div class="form-group">
                 <Button
                  class="p-button-rounded p-button-primary p-mr-2 p-mb-2"
                  icon="pi pi-check"
                  label="Simpan"
                  type="submit"
                />
                <Button
                  label="Cancel"
                  class="p-button-rounded p-button-secondary p-mr-2 p-mb-2"
                  icon="pi pi-times"
                  @click="$router.push('/detail-rfs-bentu/'+this.$route.params.code)"
                />
              </div>
            </form>
          </div>
      </div>
      </div>
    </div>
</template>
<script>
export default {
  data() {
    return {
      detail:{
        rfs_current : '',
        rfs_next:'',
        rfs_remark:''
      },
      errors:[],
      token: localStorage.getItem('token')
    };
  },
  methods: {
    CreateDetail() {
        this.errors = [];
        this.axios.post('/api/add-detail-rfs-bentu/'+this.$route.params.code, this.detail,{headers: {'Authorization': 'Bearer '+this.token}}).then(()=>{
        this.$toast.add({
          severity: "success",
          summary: "Success Message",
          detail: "Success Create",
        });
        setTimeout( () => this.$router.push('/detail-rfs-bentu/'+this.$route.params.code),1000);
        }).catch(error=>{
          this.errors = error.response.data.errors;
         });
      },
  },
};
</script>