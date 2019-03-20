const path = require('path')
const PrerenderSPAPlugin = require('prerender-spa-plugin')
const Renderer = PrerenderSPAPlugin.PuppeteerRenderer

module.exports = {
  assetsDir: process.env.NODE_ENV === 'production' ? 'dist' : '',
  pwa: {
    name: 'My dinamic app',
    themeColor: '#4DBA87',
    msTileColor: '#000000',
    appleMobileWebAppCapable: 'yes',
    appleMobileWebAppStatusBarStyle: 'black'
  },
  chainWebpack: config => {
    config.plugin('html').tap(([options]) => [Object.assign(options,
      {
        titleLoader: `<title>That would be a dinamic title</title>`
      }
    )])
    config.module.rule('fonts')
      .test(/\.(woff2?|eot|ttf|otf)(\?.*)?$/)
      .use('url-loader')
      .tap(options => {
        return {
          limit: 10000,
          name: 'fonts/[name].[hash:7].[ext]'
        }
      })
  },
  configureWebpack: config => {
    if (process.env.NODE_ENV !== 'production') return
    return {
      plugins: [
        new PrerenderSPAPlugin({
          // Required - The path to the webpack-outputted app to prerender.
          staticDir: path.join(__dirname, 'dist'),

          // Optional - The path your rendered app should be output to.
          // (Defaults to staticDir.)
          outputDir: path.join(__dirname, 'dist'),

          // Optional - The location of index.html
          indexPath: path.join(__dirname, 'dist', 'index.html'),

          // Required - Routes to render.
          routes: ['/'],
          // Optional - Uses html-minifier (https://github.com/kangax/html-minifier)
          // To minify the resulting HTML.
          // Option reference: https://github.com/kangax/html-minifier#options-quick-reference
          minify: {
            collapseBooleanAttributes: true,
            collapseWhitespace: true,
            decodeEntities: true,
            keepClosingSlash: true,
            sortAttributes: true
          },
          // The actual renderer to use. (Feel free to write your own)
          // Available renderers: https://github.com/Tribex/prerenderer/tree/master/renderers
          renderer: new Renderer({
            // Optional - The name of the property to add to the window object with the contents of `inject`.
            injectProperty: '__PRERENDER_INJECTED',
            // Optional - defaults to 0, no limit.
            // Routes are rendered asynchronously.
            // Use this to limit the number of routes rendered in parallel.
            maxConcurrentRoutes: 4,
            // Other puppeteer options.
            // (See here: https://github.com/GoogleChrome/puppeteer/blob/master/docs/api.md#puppeteerlaunchoptions)
            headless: false // Display the browser window when rendering. Useful for debugging.
          })
        })
      ]
    }
  }
}
