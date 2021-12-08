<template>
  <div class="p-grid crud-demo">
    <div class="p-col-12">
      <div class="card">
        <Toast />
        <ConfirmDialog> </ConfirmDialog>
        <Toolbar class="p-mb-4">
          <template #start>
            <div class="p-grid p-dir-col">
			        <div class="p-col">
				        <h4>EMP BENTU (My RFS)</h4>
			        </div>
            </div>
          </template>
           <template #end >
            <div>
                <label style="width:110px">No RFS </label>
                <label>: {{this.detailRfs.rfs_id}} </label>
                <br>
                <label style="width:110px">Judul Tender </label>
                <label>: {{this.detailRfs.rfs_name}}</label>
                <br>
                <label style="width:110px">HPS/OE </label>
                <label v-if="this.detailRfs.rfs_hps">: {{this.detailRfs.rfs_valuta_code}} {{formatPrice(this.detailRfs.rfs_hps)}}</label>
                <br>
                <label style="width:110px">Date Received </label>
                <label>: {{formatDate(this.detailRfs.rfs_date)}}</label>
                </div>
          </template>
        </Toolbar>
        <DataTable
          :value="detail"
          :paginator="true"
          :rows="25"
          :loading="loading"
          :filters="filters"
          :rowHover="true"
          paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport RowsPerPageDropdown"
          :rowsPerPageOptions="[5, 10, 15, 20, 25, 30, 35, 40, 45, 50]"
          currentPageReportTemplate="Showing {first} to {last} of {totalRecords} EMP BENTU (RFS)"
          responsiveLayout="scroll"
        >
       <template #header>
            <div class="table-header p-d-flex p-flex-column p-flex-md-row p-jc-md-between">
              <Button
              label="Add"
              class="p-button-raised"
              v-if="this.detailRfs.rfs_status =='1'"
              icon="bi bi-file-earmark-plus-fill"
              @click="$router.push({
                    name: 'Add Detail RFS Bentu',
                    params: { code: this.$route.params.code },
                  })"
            />
              <span class="p-input-icon-left">
                <i class="pi pi-search" />
                <InputText
                  v-model="filters['global'].value"
                  placeholder="Search. . ."
                />
              </span>
            </div>
          </template>
           <template #empty>
            Not Found
          </template>
          <template #loading>
            Loading data. Please wait.
          </template>
          <Column field="rfsd_id" header="No" :sortable="true" style="min-width:8rem"/>
          <Column field="rfs_current" header="Current Process" :sortable="true" style="min-width:12rem"/>
          <Column field="rfs_remark" header="Remarks" :sortable="true" style="min-width:12rem"/>
          <Column field="rfs_next" header="Next Process" :sortable="true" style="min-width:12rem"/>
          <Column style="min-width:8rem">
            <template #body="slotProps">
              <Button
                class="p-button-rounded p-button-info p-mr-2 p-mb-2"
                icon="bi bi-pen"
                v-if="this.detailRfs.rfs_status =='1'"
                @click="
                  $router.push({
                    name: 'Edit Detail RFS Bentu',
                    params: { rfsd_id: slotProps.data.rfsd_id },
                  })"
              />
            </template>
          </Column>
          <template #footer>
            <div class="p-grid p-dir-col">
			        <div class="p-col">
				        <div class="box">
                  <Button label="Kembali" class=" p-button-raised p-button-secondary p-mr-2 p-mb-2" @click="$router.push('/my-rfs-bentu')" icon="pi pi-chevron-left" />
                  <SplitButton v-if="this.detail.length" label="Print" icon="bi bi-printer-fill" class="p-mr-2 p-mb-2" :model="items"/>
                </div>
			        </div>
            </div>
          </template>
        </DataTable>   
      </div>
    </div>
  </div>
</template>
<script>
import moment from 'moment';
import {FilterMatchMode} from 'primevue/api';
export default {
  data() {
    return {
        items: [
                  {
                      label: 'PDF',
                      icon: 'bi bi-file-earmark-pdf text-danger',
                      command: () => {
                          window.open('/api/cetak-pdf-rfs-bentu-detail/'+this.$route.params.code);
                      }
                  },
                  {
                      label: 'EXCEL',
                      icon: 'bi bi-file-earmark-excel text-success',
                      command: () => {
                          window.open('/api/cetak-excel-rfs-bentu-detail/'+this.$route.params.code);
                      }
                  },
        ],
         loading: true,
         detail: [],
         detailRfs:[],
         filters: { 'global': {value: null, matchMode: FilterMatchMode.CONTAINS} },
         token: localStorage.getItem('token'),
         usr_name : localStorage.getItem('usr_name'),
    };
  },
  mounted() {
    this.getDetailRfs();
  },
  methods: {
    formatDate(date) {
      return moment(date).format("DD MMM YYYY")
    },
    formatPrice(value) {
        let val = (value/1).toFixed(2).replace('.', ',')
        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    },
    getDetailRfs(){
      this.axios.get('/api/detail-rfs-bentu/'+this.$route.params.code, {headers: {'Authorization': 'Bearer '+this.token}}).then((response)=> {
        this.detail = response.data.dtl;
        this.detailRfs = response.data.rfs;
        this.loading = false;
      }).catch(error=>{
          if (error.response.status == 403) {
           this.$toast.add({
            severity:'error', summary: 'Error', detail:'Cannot Access This Page'
          });
          setTimeout( () => this.$router.push('/Dashboard'),2000);
          }
           else if (error.response.status == 401) {
            this.$toast.add({
            severity:'error', summary: 'Error', detail:'Sesi Login Expired'
          });
          localStorage.clear();
          localStorage.setItem("Expired","true")
          setTimeout( () => this.$router.push('/login'),2000);
           }
        });
    },
    CetakPdf(){
      window.open('api/report-cash-pdf');
    },
    CetakExcel(){
      window.open('api/report-cash-excel');
    },
  },
};
</script>
<style lang="scss" scoped>
.p-splitbutton {
    margin-right: .5rem;
}
</style>