import React from 'react';
import logo from './logo.svg';
import './App.css';
import {run, allMessages} from './lib/doom-wrapper';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';


allMessages.subscribe(s => toast(s, {autoClose: 5000}));

run();

const App: React.FC = () => {
    return (
    <div className="App">
        <div style={{'position': 'fixed'}}>
            <ToastContainer/>
        </div>
    </div>
  );
};

export default App;
