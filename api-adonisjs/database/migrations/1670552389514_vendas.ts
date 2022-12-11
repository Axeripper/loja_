import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'vendas'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id_vendas').primary()
      table.integer('id_user').notNullable()
      table.integer('id_produto').notNullable()
      table.string('nome').notNullable()
      table.string('numero').notNullable()
      table.string('agencia').notNullable()
      table.string('conta').notNullable()
      table.string('codigo').notNullable()
      table.string('validade').notNullable()
      table.string('preco').notNullable()

      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
