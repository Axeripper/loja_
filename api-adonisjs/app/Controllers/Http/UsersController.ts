import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'


export default class UsersController {
  public async index({}: HttpContextContract) {
    const user = await User.all()
    return user
  }

  public async create({}: HttpContextContract) {}

  public async store({request}: HttpContextContract) {
    const body = request.only(['nome', 'cpf', 'endereco', 'cidade', 'telefone', 'email', 'password'])
    const user = await User.create({
      nome: body.nome,
      cpf: body.cpf,
      endereco: body.endereco,
      cidade: body.cidade,
      telefone: body.telefone,
      email: body.email,
      password: body.password
    })
    return user
  }

  public async show({request}: HttpContextContract) {
    const userid = request.param('id')
    const user = await User.findOrFail(userid)
    return user
  }

  public async login({auth, request, response}: HttpContextContract) {
    const email = request.input('email')
    const password = request.input('password')

    try{
      const token = await auth.use('api').attempt(email, password)
      return token
    }catch{
      return response.unauthorized('Invalid credentials')
    }
  }

  public async edit({}: HttpContextContract) {}

  public async update({request}: HttpContextContract) {
    const body = request.only(['nome', 'cpf', 'endereco', 'cidade', 'telefone', 'password'])
    const userid = request.param('id')
    const user = await User.findOrFail(userid)
    await user.merge(body).save()

    return user
  }

  public async destroy({request}: HttpContextContract) {
    const userid = request.param('id')
    const user = await User.findOrFail(userid)
    await user.delete()
    return true
  }
}
