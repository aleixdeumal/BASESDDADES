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
  const addRecipe = (recipe, id) => {
    let dg=recipe.created_at.toDate();
    let day=dg.getDate()+"/"+dg.getMonth()+"/"+dg.getFullYear()+")";
      let html = `
      <li data-id="${id}"><b>${recipe.title}</b> (${day}
        <button class="btn btn-danger btn-sm my-2">delete</button></li> 
      `;
      list.innerHTML += html;
  };

  const deleteRecipe = id => {
    const recipes = document.querySelectorAll('li');
    recipes.forEach(recipe => {
       if (recipe.getAttribute('data-id') === id) {
          recipe.remove();
       }
    });
 };
 
// get documents
// db.collection('recipes').get()
//     .then(snapshot => {
//         // console.log(snapshot.docs[0].data());
//         snapshot.forEach(doc => {
//             console.log(doc.id);
//             addRecipe(doc.data(),doc.id);
//         });
//     })
//     .catch(err => console.log(err));
const unsubscribe = db.collection('recipes').onSnapshot(snapshot => {
  // console.log(snapshot.docChanges());
  snapshot.docChanges().forEach(change => {
      // console.log(change);
      const doc = change.doc;
      // console.log(doc);
      if (change.type === 'added') {
          addRecipe(doc.data(), doc.id);
      } else if (change.type === 'removed') {
          deleteRecipe(doc.id);
      }
  });
});
      const form = document.querySelector('form');
      // add documents
      form.addEventListener('submit', e => {
        e.preventDefault();
        let now = new Date();
     
        const recipe = {
           title: form.recipe.value,
           author: "Aleix",
           created_at: firebase.firestore.Timestamp.fromDate(now)
        };
        form.recipe.value = "";
        // form.formEntradaAutor.value = "";
        db.collection('recipes').add(recipe)
           .then(() => console.log('Recepta afegida!'))
           .catch(err => console.log(err))
     });
      list.addEventListener('click', e => {
        // console.log(e);
        if(e.target.tagName === 'BUTTON') {
            const id = e.target.parentElement.getAttribute('data-id');
            // console.log(id);
            db.collection('recipes').doc(id).delete()
                .then(() => console.log('recipe deleted!'))
                .catch((err) => console.log(err));
        }
    });
      
