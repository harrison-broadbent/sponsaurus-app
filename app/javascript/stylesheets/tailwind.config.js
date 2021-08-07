// module.exports = {
//   mode: 'jit',
//   purge: [
//     './app/views/**/*.erb',
//     './app/views/**/*.html'
//   ],
//   darkMode: false, // or 'media' or 'class'
//   theme: {
//     extend: {},
//   },
//   variants: {
//     extend: {},
//   },
//   plugins: [],
//   important: true
// }

module.exports = {
  purge: {
    enabled: process.env.NODE_ENV === 'production',
    content: [
      './app/**/*.html.erb',
      './app/helpers/**/*.rb',
      './app/javascript/**/*.js',
      './app/javascript/**/*.vue',
      './app/javascript/**/*.jsx',
      './public/*.html',
    ]
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        "app-yellow": "#f9d500"
      },
      fontFamily: {
        sans: ['Inter var'],
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
  important: true
}
