import 'react-sortable-tree/style.css';
import React, { Component } from 'react';
import { getTreeFromFlatData } from 'react-sortable-tree';
import { APIURL } from '../constants/Constants';
import axios from 'axios';
import Tree from './Tree';

export default class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      treeData: [],
    };
  }

  componentWillMount(){
    axios.get(`${APIURL}list-node/`)
    .then(res => {
      this.setState({
        treeData: getTreeFromFlatData({
          flatData: res.data.results.map(node => ({ ...node, title: node.name })),
          getKey: node => node.id,  
          getParentKey: node => node.parent, 
          rootKey: null, 
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
        < Tree
          treeData={this.state.treeData}
        />
      </div>
    );
  }
}
