//npm install @rollup/plugin-node-resolve --save-dev
import { nodeResolve } from '@rollup/plugin-node-resolve';

export default [{
  input: ['./node_modules/lit-html/lit-html.js'],
    output: { dir: "dist/lib", format: "esm" },
  plugins: [nodeResolve({
    browser: true
  })]
}]
