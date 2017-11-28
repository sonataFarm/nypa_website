const webpack = require('webpack');
const path = require('path');

const SRC_DIR = path.resolve(__dirname, 'frontend');
const BUILD_DIR = path.join(__dirname, 'app', 'assets', 'javascripts');

module.exports = (env = {}) => {
  return {
    entry: {
      index: [SRC_DIR + '/entry.jsx']
    },
    output: {
      path: BUILD_DIR,
      filename: 'admin_bundle.js'
    },
    // watch: true,
    devtool: 'source-map',
    resolve: {
      extensions: ['.js', '.jsx', '*']
    },
    module: {
      rules: [
        {
          test: /\.(js|jsx)$/,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader',
            options: {
              cacheDirectory: true,
              presets: ['react', 'env']
            }
          }
        }
      ]
    }
  }
};
