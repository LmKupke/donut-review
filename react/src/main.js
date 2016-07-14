import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Index from './components/index';


$(function() {
  ReactDOM.render(
    <Index />,
    document.getElementsByClassName("donut-tiles")[0]
  );
});
