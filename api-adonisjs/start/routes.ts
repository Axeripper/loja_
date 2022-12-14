/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| This file is dedicated for defining HTTP routes. A single file is enough
| for majority of projects, however you can define routes in different
| files and just make sure to import them inside this file. For example
|
| Define routes in following two files
| ├── start/routes/cart.ts
| ├── start/routes/customer.ts
|
| and then import them inside `start/routes.ts` as follows
|
| import './routes/cart'
| import './routes/customer'
|
*/

import Route from '@ioc:Adonis/Core/Route'

Route.get('/', async () => {
  return { hello: 'world' }
})

Route.get('/showUsuarios', 'UsersController.index')
Route.post('/cadastro', 'UsersController.store')
Route.resource('procurar', 'UsersController.show')
Route.post('/login', 'UsersController.login')
Route.get('showprodutos', 'ProdutosController.show_produto')
Route.resource('/show', 'ProdutosController')
Route.post('file-upload', 'ProdutosController.upload')
Route.post('/cadastro_produto', 'ProdutosController.store')
Route.get('showall', 'ProdutosController.index')
Route.get('mostrarUsers', 'UsersController.showUsers')
Route.post('/storevendas', 'VendasController.storevendas')
Route.get('showvendas', 'ProdutosController.showvendas')
