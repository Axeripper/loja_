import { DateTime } from 'luxon'
import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'

export default class Venda extends BaseModel {
  @column({ isPrimary: true })
  public id_vendas: number

  @column()
  public id_user: String

  @column()
  public id_produto: String
  
  @column()
  public nome: String 

  @column()
  public numero: String 

  @column()
  public agencia: String 

  @column()
  public conta: String 

  @column()
  public codigo: String 

  @column()
  public validade: String 

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
