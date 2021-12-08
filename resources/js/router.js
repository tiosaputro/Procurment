import { createRouter, createWebHistory } from 'vue-router';
const routes = [
    {
        name: 'Login',
        path: '/login',
        component: () => import('./components/Login.vue'),

    },
    {
        name: 'Dashboard',
        path: '/dashboard',
        component: () => import('./components/Dashboard.vue'),

    },
    //emp bentu Rfs
    {
        name: 'All RFS Bentu',
        path: '/all-rfs-bentu',
        component: () => import('./components/bentu/rfs/AllRfs.vue'),
    },
    {
        name: 'My RFS Bentu',
        path: '/my-rfs-bentu/',
        component: () => import('./components/bentu/rfs/MyRfs.vue'),
    },
    {
        name: 'Add RFS Bentu',
        path: '/Add-rfs-bentu/',
        component: () => import('./components/bentu/rfs/Add_Rfs.vue'),
    },
    {
        name: 'Edit RFS Bentu',
        path: '/Edit-rfs-bentu/:code',
        component: () => import('./components/bentu/rfs/Edit_Rfs.vue'),
    },
    //emp bentu Rfs detail
    {
        name: 'Detail RFS Bentu',
        path: '/detail-rfs-bentu/:code',
        component: () => import('./components/bentu/detail_rfs/Detail_Rfs_Bentu.vue'),
    },
    {
        name: 'Add Detail RFS Bentu',
        path: '/Add-detail-rfs-bentu/:code',
        component: () => import('./components/bentu/detail_rfs/Add_Detail_Rfs_Bentu.vue'),
    },
    {
        name: 'Edit Detail RFS Bentu',
        path: '/Edit-detail-rfs-bentu/:code/:rfsd_id',
        component: () => import('./components/bentu/detail_rfs/Edit_Detail_Rfs_Bentu.vue'),
    },
];
const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;