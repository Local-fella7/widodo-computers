import { createRouter, createWebHistory, } from 'vue-router'
import HomeView from '@/views/HomeView.vue'
import AboutView from '@/views/AboutView.vue'
import Manage from '@/views/Manage.vue'
import  useUserStore  from '../stores/user';

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    component: AboutView
    },
   {
    path:'/manage-music',
    name:'manage',
    component: Manage,
    beforeEnter: (to, from, next) => {
        console.log('beforeEnter');
        console.log('Manage Router Guard');
        next();
        },
        meta: {
          requiresAuth: true,
        }

   },

   {
    path: '/manage',
    redirect: {name: 'manage'}
   },
   {
    path: '/:catchAll(.*)*',
    redirect: {name: 'home'},
   }
];
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  linkExactActiveClass: 'text-yellow-500',
})

router.beforeEach((to, from, next) => {
  if(!to.meta.requiresAuth)
    {
      next();
      return;
      }

      const store = useUserStore();
      if(store.userLoggedIn){
        next();
      }else{
        next({name: 'home'})
      }

})

// const router = createRouter({
//   history: createWebHistory(import.meta.env.BASE_URL),
//   routes: [
//     {
//       path: '/',
//       name: 'home',
//       component: HomeView,
//     },
//     {
//       path: '/about',
//       name: 'about',
//       // route level code-splitting
//       // this generates a separate chunk (About.[hash].js) for this route
//       // which is lazy-loaded when the route is visited.
//       component: () => import('../views/AboutView.vue'),
//     },
//   ],
// })

export default router
