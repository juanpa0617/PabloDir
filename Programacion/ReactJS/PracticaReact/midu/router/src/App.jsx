import './App.css'

function HomePage() {
return(
  <>
  <h1>Home</h1>
  <p>Esta es la página de inicio para hacer un router</p>
  <a href="/about"> Ir a nosotros</a>
  </>
  )
}
function aboutPage() {
  return(
    <>
    <h1>About</h1>
    <div>
      <img src="https://pbs.twimg.com/profile_images/1815749056821346304/jS8I28PL_400x400.jpg" alt="eelonmusk" />
      <p>¡Hola me llamo Juan y esto  es un clon de react router!</p>

    </div>
    <a href="/"> Ir a la home</a>
    </>
    )
  }
function App() {
  return(
<main>
 <HomePage/>
 <aboutPage/>

</main>
  )
 
}

export default App
