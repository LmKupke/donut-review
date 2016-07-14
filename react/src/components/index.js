import React, { Component } from 'react';
import Donut from './donut.js';

class Index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      donuts: []
    }
    this.setDonuts = this.setDonuts.bind(this);
    this.loadDonutsFromServer = this.loadDonutsFromServer.bind(this)
  }

  loadDonutsFromServer() {
    $.ajax({
      url: '/api/donuts',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ donuts: data })
    });
  }

  aSync() {
    this.loadDonutsFromServer();
    var self = this;
    setTimeout(function() {
      self.aSync();
    }, 5000);
  }

  componentWillMount() {
    this.aSync();
  }

  setDonuts() {
    return this.state.donuts.map(data=> {
      return (
        <Donut
        key= {data['id']}
        donut_id= {data['id']}
        name= {data['name']}
        image= {data['image']}
        />
      );
    })
  }

  render() {
      return (
      <div className='index-donut'>
        {this.setDonuts()}
      </div>
    )
  }
}


export default Index;
