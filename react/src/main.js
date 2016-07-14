import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Index from './components/index';

$(function() {
  let donutsIndex = document.getElementsByClassName('app')[0];
  if (donutsIndex) {
    ReactDOM.render(
      <Index />,
      donutsIndex
    );
  }
});
