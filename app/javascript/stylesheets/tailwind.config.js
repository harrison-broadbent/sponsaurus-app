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

const colors = require('tailwindcss/colors')
module.exports = {
  purge: {
    enabled: process.env.NODE_ENV === 'production',
    content: [
      './app/**/*.html.erb',
      './app/views/**/*.erb',
      './app/views/**/*.html',
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
        "app-yellow": colors.yellow["400"],
        // "blueGray": colors.blueGray,
        // "warmGray": colors.warmGray
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
