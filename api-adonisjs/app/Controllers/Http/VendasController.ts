import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Venda from 'App/Models/Venda'


export default class UsersController {
  /*public async index({}: HttpContextContract) {
    const user = await User.all()
    return user
  }*/

  public async create({}: HttpContextContract) {}

  public async storevendas({request}: HttpContextContract) {
    const body = request.only(['id_user','id_produto','nome','numero', 'agencia', 'conta', 'codigo', 'validade'])
    const venda = await Venda.create({
      id_user: body.id_user,
      id_produto: body.id_produto,
      nome: body.nome,
      numero: body.numero,
      agencia: body.agencia,
      conta: body.conta,
      codigo: body.codigo,
      validade: body.validade,
    })
    return venda
}
}
