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
        </Toolbar>
        <DataTable
          :value="rfs"
          :paginator="true"
          :rows="25"
           showGridlines
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
              icon="bi bi-file-earmark-plus-fill"
              @click="$router.push('/Add-rfs-bentu')"
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
          <Column field="rfs_id" header="No. RFS" :sortable="true" style="min-width:8rem"/>
          <Column field="rfs_name" header="Tender Title" :sortable="true" style="min-width:12rem"/>
          <Column field="rfs_hps" header="HPS/OE" :sortable="true" style="min-width:12rem">
            <template #body="slotProps">
              {{slotProps.data.rfs_valuta_code}} {{ formatPrice(slotProps.data.rfs_hps) }}
            </template>
          </Column>
          <Column field="rfs_date" header="Date Received" sortable style="min-width:10rem">
            <template #body="slotProps">
              {{ formatDate(slotProps.data.rfs_date) }}
            </template>
          </Column>
          <Column field="rfs_methode" header="Tender Methode" :sortable="true" style="min-width:12rem"/>
          <Column field="rfs_status"  header="Tender Status" :sortable="true" style="min-width:10rem"/>
          <Column style="min-width:12rem">
            <template #body="slotProps">
              <Button
                class="p-button-rounded p-button-secondary p-mr-2 p-mb-2"
                icon="bi bi-info-circle-fill"
                @click="
                  $router.push({
                    name: 'Detail RFS Bentu',
                    params: { code: slotProps.data.rfs_id },
                  })"
              />
              <Button
                class="p-button-rounded p-button-info p-mr-2 p-mb-2"
                icon="bi bi-pen"
                v-if="slotProps.data.rfs_status == 'On Progress'"
                @click="
                  $router.push({
                    name: 'Edit RFS Bentu',
                    params: { code: slotProps.data.rfs_id },
                  })"
              />
              <Button
                class="p-button-rounded p-button-success p-mr-2 p-mb-2"
                icon="pi pi-check-circle"
                v-if="slotProps.data.rfs_status == 'On Progress'"
                @click="changeStatus(slotProps.data.rfs_id)"
              />
            </template>
          </Column>
          <template #footer>
               <div class="p-grid p-dir-col">
			        <div class="p-col">
				        <div class="box">
                  <SplitButton label="Print" icon="bi bi-printer-fill" :model="items"/>
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
                      icon: 'bi bi-file-earmark-pdf-fill text-danger',
                      command: () => {
                          this.$toast.add({severity:'success', summary:'Updated', detail:'Data Updated', life: 3000});
                      }
                  },
                  {
                      label: 'EXCEL',
                      icon: 'bi bi-file-earmark-excel-fill text-success', 
                      command: () => {
                          this.$toast.add({ severity: 'warn', summary: 'Delete', detail: 'Data Deleted', life: 3000});
                      }
                  },
        ],
         loading: true,
         rfs: [],
         filters: { 'global': {value: null, matchMode: FilterMatchMode.CONTAINS} },
         token: localStorage.getItem('token'),
         usr_name : localStorage.getItem('usr_name'),
    };
  },
  created() {
    this.getRfs();
  },
  methods: {
    changeStatus(rfs_id){
      this.$confirm.require({
        message: 'Are you sure you want change tender status?',
        header: 'Confirmation',
        icon: 'pi pi-exclamation-triangle',
        accept: () => {
          this.axios.get('api/change-status-rfs-bentu/'+rfs_id, {headers: {'Authorization': 'Bearer '+this.token}});
          this.$toast.add({severity:'info', summary:'Confirmed', detail:'Tender Status Changed', life: 2000});
          this.getRfs();
        },
        reject: () => {
          {}
        }
      });
    },
    formatDate(date) {
      return moment(date).format("DD MMM YYYY")
    },
    formatPrice(value) {
        let val = (value/1).toFixed(2).replace('.', ',')
        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    },
    getRfs(){
      this.axios.get('api/my-rfs-bentu/'+this.usr_name, {headers: {'Authorization': 'Bearer '+this.token}}).then((response)=> {
        this.rfs = response.data;
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
    DeleteCash(ca_id){
       this.$confirm.require({
        message: "Data ini benar-benar akan dihapus?",
        header: "Delete Confirmation",
        icon: "pi pi-info-circle",
        acceptClass: "p-button-danger",
        acceptLabel: "Ya",
        rejectLabel: "Tidak",
        accept: () => {
          this.$toast.add({
            severity: "info",
            summary: "Confirmed",
            detail: "Record deleted",
            life: 3000,
          });
          this.axios.delete('api/delete-cash/'+ca_id, {headers: {'Authorization': 'Bearer '+this.token}});
          this.getCash();
        },
        reject: () => {},
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