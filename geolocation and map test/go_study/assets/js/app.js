y// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import React from 'react';
import ReactDOM from 'react-dom';
import { useState, useEffect } from 'react';
//import { Map, GoogleApiWrapper } from 'google-maps-react';
import GoogleMapReact from 'google-map-react';

function Geolocation() {
  const [position, setPosition] = useState({
    lat:0,
    long:0,
    acc:0,
    timestamp:null
  });

  function getPosition() {
    //check to make sure geolocation is supported
    //by this browser
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(updatePosition);
    }
  }

  function updatePosition(position) {
    setPosition({
      lat: position.coords.latitude,
      long: position.coords.longitude,
      acc: position.coords.accuracy,
      timestamp: position.timestamp
    });
  }

  function Marker() {
    return (
      <div className="pin"></div>
    );
  }

  let body = null;
  body = (<div>
            <button onClick={() => getPosition()}>Get Position</button>
            <ul>
              <li>Latitude: {position.lat}</li>
              <li>Longitude: {position.long}</li>
              <li>Timestamp: {position.timestamp}</li>
            </ul>
            <div style={{height: '100vh', width: '100%'}}>
              <GoogleMapReact
                bootstrapURLKeys={{
                  key: "", //redacted
                  language: 'en'
                }}
                center={{lat: position.lat, lng: position.long}}
                defaultZoom={16}
                >
                <Marker lat ={position.lat} lng = {position.long} text="hi"/>
              </GoogleMapReact>
            </div>
          </div>);

  return body;
}


ReactDOM.render(
  <React.StrictMode>
    <Geolocation />
  </React.StrictMode>,
  document.getElementById('root')
);
