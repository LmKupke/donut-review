import React from 'react';

const Donut = props => {

  let linkHref = `/donuts/${props.donut_id}`

  return(
    <ul className="donut-list small-block-grid-2 medium-block-grid-3 large-block-grid-4">
      <li>
        <img src={props.image} className='donut-image-index' id='individual-donut'></img>
        <a href={linkHref}>{props.name}</a>
      </li>
    </ul>
  );

}

export default Donut;
