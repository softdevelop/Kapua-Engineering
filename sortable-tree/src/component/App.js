import 'react-sortable-tree/style.css';
import React, { Component } from 'react';
import { getTreeFromFlatData } from 'react-sortable-tree';
import Search from "./Search"
import { URL } from '../constants/Constants';
import axios from 'axios';

export default class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      treeData: [],
    };
  }

  componentWillMount(){
    axios.get(`${URL}`)
    .then(res => {
      this.setState({
        treeData: getTreeFromFlatData({
          flatData: res.data.map(node => ({ ...node, title: node.name })),
          getKey: node => node.id,  
          getParentKey: node => node.parent, 
          rootKey: 0, 
        }),
      })
    })
    .catch(error => {
      console.log('Error fetching and parsing data', error);
    });
  }

  render() {
    return (
      <div>
        < Search
          treeData={this.state.treeData}
        />
      </div>
    );
  }
}
