import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Produto from 'App/Models/Produto'

export default class ProdutosController {
  public async index({}: HttpContextContract) {
    const produto = await Produto.all()
    return produto
  }

  public async create({}: HttpContextContract) {}

  public async store({request}: HttpContextContract) {
    const body = request.only(['nome', 'size', 'tipo','preco','descricao','color','image'])
    const produto = await Produto.create({
      nome: body.nome,
      size: body.size,
      tipo: body.tipo,
      preco: body.preco,
      descricao: body.descricao,
      color: body.color,
      image: body.image
    })
    return produto
  }

  public async show({request}: HttpContextContract) {
    const produtoid = request.param('id_produto')
    const produto = await Produto.findOrFail(produtoid)
    return produto
  }


  public async show_produto({request}: HttpContextContract) {

    const produto = await Produto.query().whereRaw(
      'MATCH(nome) AGAINST(?)',
      request.input('search')
    )
    return produto
  }

  public async showvendas({request}: HttpContextContract) {
    const produto = await Produto.query().innerJoin('vendas','vendas.id_produto', 'produtos.id').innerJoin('users', 'users.id', 'vendas.id_user').whereRaw('MATCH(email) AGAINST(?)',
    request.input('search')
    )
    return produto
  }

  //vendas.nome, vendas.size, vendas.descricao,vendas.color, vendasvendas.tipo, vendas.image, vendas.preco
  public async upload({request, response}: HttpContextContract){
    const files = request.allFiles()

    console.log(files)

    return response.send({
      message: 'success',
    })
  }

  public async edit({}: HttpContextContract) {}

  public async update({}: HttpContextContract) {}

  public async destroy({}: HttpContextContract) {}
}
