import { createRouter, createWebHistory } from 'vue-router';
const routes = [
    {
        name: 'Login',
        path: '/login',
        component: () => import('./components/Login.vue'),

    },
    {
        name: '',
        path: '/',
        component: () => import('./components/App.vue'),

    },
];
const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;