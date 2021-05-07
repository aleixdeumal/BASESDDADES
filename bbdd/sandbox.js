  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyBQCY_P0REKjeEGr5MwhZpmv4SXJeX_QK4",
    authDomain: "bbdddeumal.firebaseapp.com",
    projectId: "bbdddeumal",
    storageBucket: "bbdddeumal.appspot.com",
    messagingSenderId: "302254454097",
    appId: "1:302254454097:web:1092a16bb1e2f8220d0f70",
    measurementId: "G-FZJVNYD559"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);

  const db = firebase.firestore();
  db.collection('recipes');

  const list = document.querySelector('ul');
  const addRecipe = recipe => {
      let html = `
          <li>
              <div>${recipe.title}</div>
          </li>
      `;
      list.innerHTML += html;
  };
  db.collection('recipes').get()
      .then(snapshot => {
          // console.log(snapshot.docs[0].data());
          snapshot.forEach(doc => {
              // console.log(doc.data());
              addRecipe(doc.data());
          });
      })
      .catch(err => console.log(err));