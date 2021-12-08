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
             <form @submit.prevent="CreateRfs">
               <div class="p-fluid">
                <div class="p-field p-grid">
                <label for="tipe" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0" style="width:120px">Judul Tender</label>
                 <div class="p-col-3">
                <Textarea
                    v-model="rfs.rfs_name"
                    :autoResize="true"
                    placeholder="Masukan Judul Tender"
                    autofocus
                    :class="{ 'p-invalid': errors.rfs_name }"
                  />
                   <small v-if="errors.rfs_name" class="p-error">
                      {{ errors.rfs_name[0] }}
                  </small>
                  </div>
                </div>
              </div>
              <div class="p-fluid">
                <div class="p-field p-grid">
                <label class="p-col-12 p-mb-2 p-md-2 p-mb-md-0" style="width:120px">Mata Uang</label>
                 <div class="p-col-3">
                  <Dropdown
                    v-model="rfs.rfs_valuta_code"
                    :options="valuta_code"
                    :showClear="true"
                    optionLabel="nama"
                    optionValue="code"
                    placeholder="Pilih Mata Uang"
                    @change="changeCurrency()"
                    :class="{ 'p-invalid': errors.rfs_valuta_code }"
                  />
                    <small v-if="errors.rfs_valuta_code" class="p-error">
                      {{ errors.rfs_valuta_code[0] }}
                  </small>
                  </div>
                </div>
              </div>
              <div class="p-fluid">
                <div class="p-field p-grid">
                <label for="Deskripsi" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0" style="width:120px">HPS/OE</label>
                 <div class="p-col-3">
                   <InputNumber 
                    v-model="rfs.rfs_hps" 
                    mode="currency" 
                    :currency="currency" 
                    :locale="locale"
                    placeholder="Masukan Nilai HPS/OE"
                    :class="{ 'p-invalid': errors.rfs_hps }"  
                   />
                   <small v-if="errors.rfs_hps" class="p-error">
                      {{ errors.rfs_hps[0] }}
                  </small>
                  </div>
                </div>
              </div>
                 <div class="p-fluid">
                  <div class="p-field p-grid ">
                      <label class="p-col-12 p-mb-2 p-md-2 p-mb-md-0" style="width:120px">Date</label>
                    <div class="p-col-2 p-md-6">
                     <div class="p-inputgroup">
                      <DatePicker v-model="rfs.rfs_date" :masks="mask" >
                        <template v-slot="{ inputValue, togglePopover }">
                          <input
                            class="bg-white text-gray-900 w-full py-2 px-3 appearance-none border rounded-l focus:outline-none"
                            :value="inputValue"
                            @click="togglePopover"
                            placeholder="Pilih Tanggal"
                            readonly
                          />
                      <Button icon="pi pi-calendar" v-if="!rfs.rfs_date" @click="togglePopover"/>
                      <Button icon="pi pi-trash" class="p-button-danger" v-else @click="rfs.rfs_date = ''" />
                        </template>
                      </DatePicker>
                      </div>
                        <small v-if="errors.rfs_date" class="p-error">
                            {{ errors.rfs_date[0] }}
                        </small>
                      </div>
                  </div>
                </div>
              <div class="p-fluid">
                <div class="p-field p-grid">
                <label for="Status" class="p-col-12 p-mb-2 p-md-2 p-mb-md-0" style="width:120px">Metode Tender</label>
                 <div class="p-col-3">
               <Dropdown
                  v-model="rfs.rfs_methode"
                  :options="methode"
                  :showClear="true"
                  optionLabel="nama"
                  optionValue="code"
                  placeholder="Pilih Metode"
                  :class="{ 'p-invalid': errors.rfs_methode }"
                />
                   <small v-if="errors.rfs_methode" class="p-error">
                      {{ errors.rfs_methode[0] }}
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
                  @click="$router.push('/my-rfs-bentu')"
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
      rfs:{
        rfs_name : '',
        rfs_valuta_code:'',
        rfs_hps:null,
        rfs_methode:'',
        rfs_date:'',
      },
      currency: "IDR",
      locale : "id-ID",
      errors: [],
      valuta_code: [
        { nama: "USD", code: "USD" },
        { nama: "IDR", code: "IDR" },
      ],
      methode : [
          {nama : 'Open Tender', code : "1"},
          {nama : 'Penunjukan Langsung', code : "2"},
          {nama : 'Pengadaan Langsung', code : '3'}
      ],
      mask:{
        input: 'DD MMM YYYY'
      },
      token: localStorage.getItem('token')
    };
  },
  created(){
    //   this.cekUser();
  },
  methods: {
      changeCurrency(){
          if(this.rfs.rfs_valuta_code == "USD"){
              this.currency = "USD";
              this.locale = "en-US";
          }
          if(this.rfs.rfs_valuta_code == "IDR"){
              this.currency = "IDR";
              this.locale = "id-ID";
          }
      },
    // cekUser(){
    //  this.axios.get('api/ref', {headers: {'Authorization': 'Bearer '+this.token}}).then(()=> {
    //   }).catch(error=>{
    //        if ((error.response.status == 403)) {
    //        this.$toast.add({
    //         severity:'error', summary: 'Error', detail:'Cannot Access This Page'
    //       });
    //       setTimeout( () => this.$router.push('/Dashboard'),2000);
    //       }
    //        else if ((error.response.status == 401)){
    //         this.$toast.add({
    //         severity:'error', summary: 'Error', detail:'Sesi Login Expired'
    //       });
    //       localStorage.clear();
    //       localStorage.setItem("Expired","true")
    //       setTimeout( () => this.$router.push('/login'),2000);
    //        }
    //      });
    // },
    CreateRfs() {
        this.errors = [];
        if(this.rfs.rfs_hps != null){
        this.axios.post('api/add-rfs-bentu', this.rfs,{headers: {'Authorization': 'Bearer '+this.token}}).then(()=>{
        this.$toast.add({
          severity: "success",
          summary: "Success Message",
          detail: "Success Create",
        });
        setTimeout( () => this.$router.push('/my-rfs-bentu'),1000);
        }).catch(error=>{
          this.errors = error.response.data.errors;
         });
        }
      },
  },
};
</script>