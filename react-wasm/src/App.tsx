import React from 'react';
import logo from './logo.svg';
import './App.css';
import ReactWasm from './wasm/react-wasm.js';
// @ts-ignore
const stdin = function writeToStdIn(buf) {
  return function() {
    if (!buf.length) {
      return null;
    }
    const c = buf[0];
    buf = buf.slice(1);
    return c;
  };
};
// stdout is a function which accepts characters
// @ts-ignore
const stdout = function (char) {
  console.log(char);
};
// so is stderr
// @ts-ignore
const stderr = function (char) {
  console.warn(char);
};
ReactWasm({stdin, stdout, stderr});

const App: React.FC = () => {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
