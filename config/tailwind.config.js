const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}

// tailwind.config.js
// module.exports = {
//   theme: {
//     extend: {
//       gradientColorStops: {
//         'blue-100': '#AEEEEE',
//         'blue-400': '#0066CC',
//       },
//     },
//   },
//   variants: {},
//   plugins: [],
// }
