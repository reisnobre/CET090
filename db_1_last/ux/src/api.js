/*
 * Items should not be deleted, they should be created by an admin and it's content shoud be edited only
 * Define pages
 * - Início
 * - Serviços
 * - Empresa
 *
 * Define Home Items
 *
*/
const env = process.env.NODE_ENV

const dev = 'http://localhost/race/wordpress/index.php/wp-json/wp/v2'
const prod = 'http://nit.uesc.br/sisnit-server/public'

export const pages = {
  home: 0,
  services: 0,
  about: 0,
  network: 0,
  contact: 0
}

export const api = options => {
  let secure = options.secure === undefined ? true : options.secure
  if (secure) {
    if (env === 'production') return `${prod}/api/v1/${options.service ? options.service + '/' : ''}${options.target}`
    return `${dev}`
  } else {
    if (env === 'production') return `${prod}/${options.service ? options.service + '/' : ''}${options.target}`
    return `${dev}`
  }
}
