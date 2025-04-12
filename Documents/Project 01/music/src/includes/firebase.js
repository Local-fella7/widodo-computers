import  firebase from "firebase/app";
import "firebase/auth";
import "firebase/firestore";


const firebaseConfig = {
  apiKey: "AIzaSyDUuEeWb_BRcIsMTac6n6-hAmY4gUJZeyM",
  authDomain: "music-2ab32.firebaseapp.com",
  projectId: "music-2ab32",
  storageBucket: "music-2ab32.firebasestorage.app",
  // messagingSenderId: "1000017624530",
  appId: "1:1000017624530:web:ca612c36f3b886b0f51c0b"
};

firebase.initializeApp(firebaseConfig)

const auth = firebase.auth();
const db = firebase.firestore();
const userCollection = db.collection("users")

export { auth, db, userCollection };

