import React, { Component } from 'react';
import Review from 'review';

class Index extends Component {
  constructor(props) {
    super(props);
    this.state = { reviews: null };
  }

  componentDidMount() {
    $.ajax({
    url: '/api/reviews',
    contentType: 'application/json'
    })
    .done(data=> {
      this.setState({ reviews: data })
    });
  }

  let reviews = this.state.reviews.map(review=> {
    return (
      <Review
        donut_id: {review.donut_id}
        rating: {review.rating}
        body: {review.body}
        user_id: {review.user_id}
        />
    )
  })
}


export default Index;
