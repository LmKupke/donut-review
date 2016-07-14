import React, { Component } from 'react';
import Donut from './donut.js';

class Index extends Component {
  constructor(props) {
    super(props);
    this.state = {
      donuts: []
    }
    this.setDonuts = this.setDonuts.bind(this);
  }

  componentDidMount() {
    $.ajax({
      url: '/api/donuts',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ donuts: data })
    });
  }

  setDonuts() {
    return this.state.donuts.map(data=> {
      return (
        <Donut
        key= {data["id"]}
        name= {data['name']}
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
