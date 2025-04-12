import { defineStore } from "pinia";
import { auth, userCollection } from "@/includes/firebase";


export default defineStore('user',{
  state: () => ({
    userLoggenIn: false,
  }),
  actions: {
    async register(values){
       const userCred = await auth.createUserWithEmailAndPassword(
        values.email,
        values.password
      );

      await userCollection.doc(userCred.user.uid).set({
        name: values.name,
        email: values.email,
        age: values.age,
        country: values.country,

      });

      await userCred.user.updateProfile({
        displayName: values.name,
      })

      this.userLoggenIn = true;
    },
    async authenticate(values){
      const userCred = await auth.signInWithEmailAndPassword(
          values.email,
          values.password
      );

      this.userLoggedIn = true;

      return userCred;

  },
  async signOut(){
    await auth.signOut();
    this.userLoggedIn = false;
  },
 },
})

